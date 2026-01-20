---
title: "L'électronique du robot principal"
parent: Robot
has_children: true
layout: technical
---

# Documentation – Carte électronique "Doom"


## 1. Introduction

### a. Objectif de la carte

Cette carte électronique a été conçue dans le cadre de la Coupe de France de Robotique, édition 2026. Elle constitue le cœur électronique du robot principal et a pour vocation de centraliser l’ensemble des fonctions nécessaires à son fonctionnement.

L’un des objectifs majeurs de cette carte est son **utilisation sur plusieurs années**. La structure mécanique du robot étant prévue pour rester inchangée sur le long terme, la carte a été conçue de manière à rester mécaniquement et électriquement compatible d’une saison à l’autre. De la même manière, l’architecture logicielle est pensée pour être stable dans le temps, limitant les évolutions nécessaires entre les différentes éditions de la compétition.

La carte assure de façon autonome la gestion de toutes les actions du robot, notamment :
- la logique de contrôle globale,
- le pilotage des moteurs et des actionneurs,
- la gestion des capteurs,
- la distribution et la régulation de la puissance,
- la communication avec des éléments externes.

Afin de garantir une organisation claire et robuste, les missions sont **segmentées** à l’aide de trois microcontrôleurs distincts :
- un microcontrôleur principal chargé de la supervision globale, de la gestion de l’interface écran et de la coordination des deux autres microcontrôleur.
- un microcontrôleur dédié à la gestion des capteurs,
- un microcontrôleur dédié aux drivers et aux actionneurs,

Cette segmentation permet d’améliorer la lisibilité de l’architecture, la fiabilité du système et la maintenance logicielle. Des ports d’extension I²C sont également prévus afin de permettre l’ajout futur de fonctionnalités sans remise en cause de la carte principale.

### b. Version tout-en-un

La carte présentée dans cette documentation correspond à une **version tout-en-un** regroupant l’ensemble des fonctions auparavant réparties sur plusieurs cartes distinctes. Les architectures précédentes prévoyaient notamment :
- une carte principale,
- une carte drivers,
- une carte dédiée au LIDAR,
- une carte écran,
- une carte d’extension,
- une carte d’alimentation.

Bien que ces cartes aient été entièrement conçues et prêtes pour une mise en production, le choix a été fait de regrouper l’ensemble de ces fonctions sur une seule carte électronique.

Cette approche vise principalement à :
- **simplifier le câblage**, tant pour les signaux logiques que pour la puissance,
- **faciliter l’installation** et l’intégration dans le robot,
- **améliorer la maintenance**, en réduisant le nombre de points de défaillance,
- **augmenter la fiabilité en compétition**, en limitant les faux contacts et les erreurs de branchement.

La carte tout-en-un remplace ainsi l’intégralité des cartes précédemment envisagées. Les connexions ont été rationalisées et standardisées à l’aide de connecteurs Molex et JST pour les signaux, et de connecteurs XT60 pour l’alimentation, garantissant à la fois robustesse et facilité de manipulation.

Ce choix d’architecture permet d’obtenir un système plus compact, plus fiable et plus simple à exploiter, tout en conservant une modularité suffisante pour les évolutions futures.


## 2. Présentation générale

### a. Description générale

La carte électronique présente un format rectangulaire de **98 mm × 171 mm**. Ce gabarit a été défini afin de s’intégrer durablement dans l’architecture mécanique du robot, prévue pour être conservée sur plusieurs saisons. La carte est conçue en **double couche**, permettant un compromis entre compacité, simplicité de routage et maîtrise des coûts de fabrication.

Elle est installée **verticalement dans le sens de la longueur** au sein du robot. Cette orientation facilite l’intégration mécanique, l’accessibilité aux connecteurs ainsi que le refroidissement, la carte étant directement ventilée.

D’un point de vue fonctionnel, la carte centralise l’ensemble des capacités nécessaires au fonctionnement du robot. Elle assure notamment :
- le pilotage de **6 moteurs pas à pas**,
- la commande de **32 servomoteurs**,
- la gestion de **16 pompes**,
- l’interface avec un **LIDAR**,
- la communication et la programmation via des **ports USB** directement reliés aux microcontrôleurs,
- la possibilité d’intégrer un **module XBee optionnel** pour la communication sans fil,
- la gestion d’un **écran tactile** servant d’interface principale,
- la présence de **8 boutons binaires** permettant le paramétrage et le contrôle du robot en cas de défaillance de l’écran.

La carte est également conçue pour rester évolutive. Elle dispose de connecteurs permettant l’ajout :
- d’une carte indépendante communiquant en **UART**,
- de cartes d’extension via le bus **I²C**.

Enfin, la carte intègre la **gestion complète de la puissance**, incluant la régulation, la distribution et les protections électriques nécessaires au bon fonctionnement des différents sous-systèmes du robot.

### b. Contraintes spécifiques à la compétition

L’utilisation en Coupe de France de Robotique impose des contraintes spécifiques liées à l’environnement et au déroulement des matchs. Le robot étant mobile, la carte est soumise à des **vibrations régulières** ainsi qu’à des **chocs ponctuels**, notamment lors de contacts avec les bordures du terrain. Ces contraintes ont été prises en compte dès la conception mécanique et électronique afin d’assurer la fiabilité de l’ensemble.

La carte est installée dans une zone ventilée du robot, éloignée des moteurs, ce qui limite son exposition aux perturbations électromagnétiques, à la poussière et aux projections. Aucune contrainte directe du règlement ne s’applique à la taille de la carte, celle-ci étant uniquement limitée par l’encombrement global du robot.

En termes de fonctionnement, un match de compétition dure **100 secondes**, mais la carte doit rester opérationnelle bien au-delà de cette durée. En pratique, le robot est allumé pendant toute la phase de préparation, pouvant atteindre **jusqu’à 10 minutes**, ainsi que lors des nombreuses phases de test.

Une attention particulière est portée à la **gestion de la consommation électrique**. La présence de nombreux servomoteurs et pompes implique des courants importants, susceptibles de provoquer des chutes de tension lors d’activations simultanées. La carte est donc conçue pour permettre une gestion maîtrisée de ces charges, tant au niveau matériel que logiciel, afin de garantir un fonctionnement stable tout au long des matchs et des essais.


## La carte
<model-viewer alt="carte V1" style="width:80%; height:400px"  src="./image/model_carte.glb" ar shadow-intensity="1" camera-controls touch-action="pan-y"></model-viewer>

<kicanvas-embed controls="full">
<kicanvas-source src="image/doom_v1.kicad_sch"></kicanvas-source>
<kicanvas-source src="image/doom_v1.kicad_pcb"></kicanvas-source>
</kicanvas-embed>

## 3. Architecture matérielle 

  ### a. Schéma fonctionnel (diagramme de blocs)
  - shéma de quentin 

  ### b. Description des sous-ensembles :
  - Alimentation et convertisseurs
  - Microcontrôleurs / logique de contrôle
  - Interfaces de communication
  - Capteurs / modules
  - connecteurs 

## 4. La concption
  - lien vers conception.md

## 5. Caractéristiques techniques

  ### a. Tension et consomation (à calculer)
  - Tension
  - consomation(à calculer)

  ### b. Interfaces de communication interne et externe
  - UART
  - I²C
  - xbee


## 6. Liste des composants et assemblage
  - lien vers assemblage.md

## 7. Maintenance et dépannage
- Problèmes connus
- Remplacement de composants


## 8. Historique des versions
- Version de la carte
- Modifications
- Date
- Responsable

## 9. Annexes
- Schémas complets
- Datasheets importantes
- Notes de calcul
- Liens vers dépôts ou ressources
