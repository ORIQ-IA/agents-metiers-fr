// Genere agents.json, l'index machine des agents publies.
//
// POURQUOI. Deux consommateurs ont besoin de la liste sans cloner le depot :
// le serveur MCP d'Oriq, qui la lit pour savoir quels metiers il peut servir,
// et tout outil tiers qui voudrait reutiliser la collection. Lister les
// fichiers par l'API GitHub demanderait un jeton et une limite de debit ; un
// fichier statique ne demande rien.
//
// Il se regenere : node scripts-index.mjs
import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const GROUPES = [
  ["secteurs", "agents-secteurs-fr", "secteur"],
  ["fonctions", "agents-fonctions-fr", "fonction"],
  ["transverses", "agents-transverses-fr", "transverse"],
];

const agents = [];
for (const [, plugin, genre] of GROUPES) {
  const dir = join("plugins", plugin, "agents");
  for (const nom of readdirSync(dir).filter((n) => n.endsWith(".md")).sort()) {
    const texte = readFileSync(join(dir, nom), "utf8");
    const desc = texte.match(/^description: (.+)$/m);
    if (!desc) throw new Error(`description manquante : ${nom}`);
    // Une description non citée qui contient « : » casse l'en-tête YAML (GitHub affiche alors une erreur).
    if (!/^".*"$/.test(desc[1].trim())) throw new Error(`description à mettre entre guillemets : ${nom}`);
    agents.push({
      nom: nom.replace(/\.md$/, ""),
      genre,
      plugin,
      // L'en-tête est du YAML : la description est entre guillemets, puisqu'elle contient « : ».
      description: desc[1].trim().replace(/^"(.*)"$/, "$1").replace(/\\"/g, '"'),
      chemin: `${dir}/${nom}`.replaceAll("\\", "/"),
    });
  }
}

const index = {
  nom: "Agents métiers FR",
  version: "1.0.0",
  editeur: { nom: "Oriq", site: "https://oriq.fr", courriel: "contact@oriq.fr" },
  depot: "https://github.com/ORIQ-IA/agents-metiers-fr",
  licence: "MIT",
  citation: "Oriq, agents métiers FR, version 1.0.0, https://github.com/ORIQ-IA/agents-metiers-fr",
  total: agents.length,
  agents,
};

writeFileSync("agents.json", JSON.stringify(index, null, 2) + "\n");
console.log(`agents.json : ${agents.length} agents indexés`);
