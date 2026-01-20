---
title: "README & MICRODOC"
layout: default
---
# Documentation de l'association UniMakers pour la CDR2026

Table de contenu:
- [Documentation de l'association UniMakers pour la CDR2026](#documentation-de-lassociation-unimakers-pour-la-cdr2026)
  - [Comment créer une page ?](#comment-créer-une-page-)
  - [Comment afficher un modèle 3D](#comment-afficher-un-modèle-3d)


## Comment créer une page ?

Allez dans le dossier correspondant au thème de la page, 

exemple pour l'élec du robot principal: Robot/Elec/

Créez un nouveau fichier pour votre nouvelle page.

Rajoutez en haut du fichier:

```yaml
---
title: "Titre de votre page"
layout: technical
---
```

Utilisez `layout: technical` si vous souhaitez utiliser les modèles 3D ou le visualiseur kicad dans votre page, sinon utilisez `layout: default` pour réduire le temps de chargement de la page en supprimant les imports inutiles.

Les clés de définition doivent se trouver entre les deux `---`.
Après le deuxième `---` vous pouvez écrire le contenu de la page **en markdown**.

Vous pouvez rajouter un 
```yaml
has_children: true
```
si vous souhaitez faire de cette page une page de catégorie qui aura donc des sous-pages.

Pour mettre cette page en tant que sous-page dans une catégorie (et non à la racine) vous devez rajouter une clé `parent` et eventuellement une clé `grand_parent`:

La clé `parent` permettra de définir le parent direct de la page, la valeur doit etre le titre de la page parent.

Exemple, si vous créez une page dans la catégorie `Electronique` du `Robot` vous devrez définir la clé `parent` avec la valeur `Electronique`.

La clé `grand_parent` permettra de définir le grand parent de la page, c'est à dire la catégorie racine, la valeur doit etre le titre du grand parent.

Exemple, si vous créez une page dans la catégorie `Electronique` du `Robot` vous devrez définir la clé `grand_parent` avec la valeur `Robot`

Actuellement l'arbre des titres et catégories est:
```
Racine:
|-Présentation
|-Robot:
| |-Mécanique
| |-Stratégie
|-Pami:
| |-Mécanique
| |-Stratégie
|-Electronique
|-Programmation
| |-Déplacement
| |-Détection
```

Exemple pour créer une catégorie `Actionneurs` dans `Mécanique` sous `Robot` et ensuite créer une page `Pince`:

On crée le dossier `Robot/Meca/Actionneurs` (c'est mieux pour la lisibilité de trier les pages dans des dossiers, techniquement on pourrait tout laisser à la racine).


On crée le fichier `Robot/Meca/Actionneurs/Actionneurs.md`:
```md
---
title: Actionneurs
parent: Mécanique
grand_parent: Robot
has_children: true
layout: default
---
# Les actionneurs de notre robot
Le robot a besoin d'actionneurs pour fonctionner
```

On crée le fichier `Robot/Meca/Actionneurs/Pince.md`:
```md
---
title: Pince
parent: Actionneurs
grand_parent: Mécanique
has_children: true
layout: default
---
# La pince du robot
La pince du robot, nécessaire pour attraper.....
```

## Comment afficher un modèle 3D

Assurez vous d'avoir défini `layout: technical` au lieu de `layout: default`.

Dans votre code markdown rajoutez:
```md
<model-viewer alt="Texte de déscription du modèle 3D" src="url / chemin du modèle 3D" ar shadow-intensity="1" camera-controls touch-action="pan-y"></model-viewer>

Ou

{%raw%}{{%include model3D.html alt="Texte de description du modèle 3D" model="url / chemin du modèle 3D"%}}{%endraw%}
``` 
Le modèle 3D **doit** être en format GLTF / GLB.

## Comment utiliser le visionneur KiCad

Assurez vous d'avoir défini `layout: technical` au lieu de `layout: default`.

- Si vous ne souhaitez que le schématique:

Dans votre code markdown rajoutez:
```md
<kicanvas-embed src="chemin/vers/fichier.kicad_sch" controls="basic"></kicanvas-embed>
```

- Si vous souhaitez le schématique ET la PCB;

Dans votre code markdown rajoutez:
```md
<kicanvas-embed controls="full">
<kicanvas-source src="chemin/vers/fichier.kicad_sch"></kicavas-source>
<kicanvas-source src="chemin/vers/fichier.kicad_pcb"></kicavas-source>
</kicanvas-embed>
```