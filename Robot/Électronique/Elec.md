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

  ### a. Description général
  - taille
  - liste des capacité

  ### b. Contraintes spécifiques à la compétition
  - Environnement (vibration,taille)
  - Temps de fonctionnement


## La carte
<model-viewer alt="carte V1" src="image_elec/doom_v1.glb" ar shadow-intensity="1" camera-controls touch-action="pan-y"></model-viewer>

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
