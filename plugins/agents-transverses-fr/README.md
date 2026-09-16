# Agents transverses FR

Six agents transverses appelés par les agents sectoriels et fonctionnels. À installer en complément de l'un des deux autres plugins, dont ils complètent les renvois.

## Installation

```
/plugin marketplace add ORIQ-IA/agents-metiers-fr
/plugin install agents-transverses-fr@oriq
```

Sans Claude Code, ouvrez le fichier d'un agent, copiez son contenu et collez-le au début
d'une conversation avec votre assistant. Aucune installation nécessaire.

## Les 6 agents

| Agent | Couvre |
|---|---|
| [`oriq-architecte-rag`](agents/oriq-architecte-rag.md) | Systèmes de recherche augmentée |
| [`oriq-cyber-ia`](agents/oriq-cyber-ia.md) | Cybersécurité appliquée à l'IA |
| [`oriq-data-engineer`](agents/oriq-data-engineer.md) | Ingénierie de la donnée |
| [`oriq-integration-api`](agents/oriq-integration-api.md) | Intégration et connecteurs |
| [`oriq-rgpd`](agents/oriq-rgpd.md) | RGPD et protection des données |
| [`oriq-voix-ia`](agents/oriq-voix-ia.md) | Interfaces vocales |

Chaque agent se termine par un bloc « Relais » qui indique lequel prendre ensuite.

## Origine

Publié par [**Oriq**](https://oriq.fr), agence IA française basée à Toulouse, sous licence MIT.
Ce plugin fait partie de la collection [agents-metiers-fr](https://github.com/ORIQ-IA/agents-metiers-fr),
aux côtés du [référentiel IA Act](https://github.com/ORIQ-IA/referentiel-ia-act) et de
l'[Observatoire IA Occitanie](https://github.com/ORIQ-IA/observatoire-ia-occitanie).

Ces agents sont aussi servis par le [connecteur Oriq](https://oriq.fr/connecteur/), à raccorder à
votre assistant sans rien installer : `https://oriq-mcp.oriq.workers.dev`, un compte individuel suffit.

Gratuit et sans inscription : le [diagnostic IA Act](https://oriq.fr/ia-act/) dit en quelques minutes
si le règlement européen s'applique à votre système, ce que vous devez faire et à quelle date.

Un besoin réel derrière un de ces cas d'usage ? contact@oriq.fr
