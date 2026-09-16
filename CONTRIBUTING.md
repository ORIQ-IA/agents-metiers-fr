# Contribuer

## Ce qui est le plus utile

Une correction venue du terrain. Si vous exercez dans un des métiers couverts et qu'un agent le
décrit mal, ouvrez une issue en disant ce qui est faux et ce qui se passe en réalité. C'est plus
utile que dix ajouts théoriques.

Les sections `Frictions` et `Ce qui décide` sont celles qui se périment le plus vite et où une
correction de praticien vaut le plus.

## Ajouter un secteur ou une fonction

Reprenez la structure décrite dans [CHARTE.md](CHARTE.md). Un agent utile tient en une cinquantaine
de lignes. Ce qui compte est la densité, pas la longueur : chaque phrase doit apprendre quelque
chose qu'on ne trouve pas dans un article générique.

Nommage : `oriq-secteur-<nom>.md` dans `agents/secteurs/`, `oriq-metier-<nom>.md` dans
`agents/metiers/`.

## Ce qui sera refusé

Du contenu générique recopié depuis un article de blog. Des promesses de gain non étayées. Des
cas d'usage qui font une bonne démonstration mais aucun gain réel. Tout ce qui contredit la charte.

## Avant d'ouvrir une pull request

Vérifiez que votre agent ne renvoie, dans son bloc `Relais`, que vers des agents présents dans ce
dépôt. Un renvoi mort casse la chaîne.
