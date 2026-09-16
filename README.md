# Agents métiers FR

28 agents IA qui connaissent les métiers et les secteurs français. Pour Claude Code, Cursor, Codex et les autres.

Un agent générique vous répondra que « l'IA peut automatiser la rédaction de vos actes ». Un notaire vous dira que ce n'est pas le sujet, que ce qui l'intéresse c'est de ne pas rater un délai, parce que sa responsabilité est engagée sur chaque acte.

Ces agents sont écrits du deuxième point de vue.

## Ce que ça change

Extrait de `oriq-secteur-notariat-juridique` :

> **Ce qui décide**
>
> Le risque professionnel avant le gain de temps. Un système qui réduit le risque d'erreur ou
> d'omission de délai intéresse plus qu'un système qui écrit vite. La responsabilité du
> professionnel est engagée sur chaque acte.

> **Contraintes**
>
> Secret professionnel absolu. Déontologie stricte. Archivage légal avec des durées longues.
> La confidentialité entre dossiers et entre clients est non négociable, y compris à l'intérieur
> de l'étude. Un système qui laisse fuir un passage d'un dossier vers un autre est disqualifiant.

Chaque agent suit la même structure : l'organisation réelle du métier, les frictions, ce qui déclenche une décision, les contraintes réglementaires, les cas d'usage qui portent, et les garde-fous.

## Installation

```bash
git clone https://github.com/ORIQ-IA/agents-metiers-fr.git
cd agents-metiers-fr
./install.sh
```

Le script copie les agents dans `~/.claude/agents/`. Pour un autre outil, les fichiers sont du Markdown avec un en-tête YAML, lisible par tout agent qui suit la convention `AGENTS.md`.

Installation d'un seul agent :

```bash
cp agents/secteurs/oriq-secteur-btp.md ~/.claude/agents/
```

## Les agents

### Secteurs (12)

| Agent | Couvre |
|---|---|
| `oriq-secteur-btp` | Bâtiment, travaux publics, artisanat |
| `oriq-secteur-collectivites` | Communes, EPCI, bailleurs, organismes territoriaux |
| `oriq-secteur-expertise-comptable` | Cabinets comptables et audit |
| `oriq-secteur-formation-education` | Organismes de formation, enseignement |
| `oriq-secteur-immobilier` | Transaction, gestion locative, syndic, promotion |
| `oriq-secteur-industrie` | Production, qualité, maintenance |
| `oriq-secteur-mutuelle-assurance` | Mutuelles, assurance de personnes, protection sociale |
| `oriq-secteur-notariat-juridique` | Notariat, avocats, professions juridiques |
| `oriq-secteur-retail-ecommerce` | Commerce, distribution, vente en ligne |
| `oriq-secteur-sante` | Établissements de santé, médico-social |
| `oriq-secteur-services-b2b` | Conseil, ingénierie, agences, ESN |
| `oriq-secteur-transport-logistique` | Exploitation, supply chain |

### Fonctions (10)

| Agent | Couvre |
|---|---|
| `oriq-metier-achats` | Sourcing, consultations, contrats fournisseurs |
| `oriq-metier-commercial` | Cycle de vente, saisie, préparation de rendez-vous |
| `oriq-metier-direction-generale` | Arbitrages et langage d'un dirigeant |
| `oriq-metier-dsi` | Exigences de sécurité, conditions d'acceptation d'un projet |
| `oriq-metier-finance` | Clôture, contrôle de gestion, facturation, recouvrement |
| `oriq-metier-juridique` | Contrats, conformité, contentieux |
| `oriq-metier-marketing` | Production de contenu, mesure |
| `oriq-metier-production-ops` | Planification, qualité, maintenance, terrain |
| `oriq-metier-rh` | Recrutement, administration, formation |
| `oriq-metier-service-client` | Volume, qualité de réponse, relation usager |

### Transverses (6)

| Agent | Couvre |
|---|---|
| `oriq-architecte-rag` | Ingestion, découpage, recherche, citation des sources |
| `oriq-cyber-ia` | Injection par le contenu, fuite de données, cloisonnement |
| `oriq-data-engineer` | Pipelines, qualité, modélisation |
| `oriq-integration-api` | API, webhooks, synchronisation, gestion des pannes |
| `oriq-rgpd` | Bases légales, minimisation, registre, droits des personnes |
| `oriq-voix-ia` | Transcription, synthèse, interruption, conversation parlée |

Les agents se renvoient la main entre eux. Le bloc « Relais » en fin de fichier indique lequel prendre ensuite.

## Ce que ces agents ne sont pas

Ce ne sont pas des conseils juridiques. `oriq-rgpd` et les mentions réglementaires des agents sectoriels décrivent un cadre, ils ne remplacent pas un avis.

Ce ne sont pas des agents de code. Ils portent de la connaissance métier, pas des recettes techniques.

Ils sont écrits pour le contexte français : vocabulaire, organisation des entreprises, droit applicable.

## Questions fréquentes

**Avec quels outils est-ce que ça marche ?**
Claude Code lit `~/.claude/agents/`. Cursor, Codex, Gemini CLI, Aider, Windsurf et les autres agents qui suivent la convention `AGENTS.md` lisent des fichiers Markdown avec en-tête YAML, c'est exactement ce format. Aucune dépendance, aucune clé API, rien à installer d'autre.

**Est-ce que ça remplace mon `CLAUDE.md` ou mon `AGENTS.md` ?**
Non, c'est complémentaire. Votre fichier de projet décrit votre code. Ces agents apportent la connaissance d'un métier ou d'un secteur, qui ne se déduit d'aucun dépôt.

**À quoi ça sert concrètement ?**
À concevoir ou évaluer un projet IA pour un métier que vous ne connaissez pas de l'intérieur. Par exemple : que faut-il savoir avant de proposer un assistant documentaire à un cabinet d'expertise comptable, quelles contraintes déontologiques pèsent sur une étude notariale, ce qui déclenche vraiment une décision dans une direction des achats, pourquoi une DSI bloque un projet, quelles obligations s'appliquent aux données de santé.

**Mon métier n'est pas couvert.**
Ouvrez une issue en décrivant le métier et ses frictions réelles. Les contributions de praticiens sont ce qui fait la valeur de ce dépôt.

**Est-ce utilisable hors de France ?**
La structure oui, le contenu en partie seulement. Les contraintes réglementaires, les intitulés de poste et l'organisation décrite sont français. Le RGPD et le règlement européen sur l'IA s'appliquent dans toute l'Union, le reste est à adapter.

**Quelle licence ?**
MIT. Usage commercial autorisé, modification autorisée, attribution demandée.

## Autres publications d'Oriq

Les trois dépôts de l'organisation [ORIQ-IA](https://github.com/ORIQ-IA) sont publics et sous licence libre.

| Dépôt | Contenu |
|---|---|
| [referentiel-ia-act](https://github.com/ORIQ-IA/referentiel-ia-act) | Référentiel daté et versionné du règlement européen sur l'IA. Échéances, sanctions et obligations, chacune avec son article et sa source. JSON, CC BY 4.0 |
| [observatoire-ia-occitanie](https://github.com/ORIQ-IA/observatoire-ia-occitanie) | Relevé des offres d'emploi liées à l'IA en Occitanie, rapporté à la population d'entreprises. 7 jeux en CSV, CC BY 4.0 |

## Citer ce dépôt

Un fichier [CITATION.cff](CITATION.cff) est fourni. GitHub affiche un bouton « Cite this repository » en haut à droite, et les outils bibliographiques le lisent directement.

## Contribuer

Une correction de terrain vaut mieux qu'un ajout théorique. Si un agent décrit mal votre métier, c'est une issue utile. Voir [CONTRIBUTING.md](CONTRIBUTING.md).

Les principes communs aux 28 agents sont dans [CHARTE.md](CHARTE.md).

## Origine

Ces agents sont extraits de l'outillage de production d'[Oriq](https://oriq.fr), agence IA française. Ils sont utilisés en vrai sur des missions, pas écrits pour la vitrine.

## Licence

MIT. Voir [LICENSE](LICENSE).
