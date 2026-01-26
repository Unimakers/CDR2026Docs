---
title: "L'électronique du robot principal"
parent: Robot
nav_order: 2
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

## 3. La conception
Si vous souhaitez en apprendre plus la conception de la carte je vous invite à cliquer sur le lien suivant --> [vers conception](./conception.html)
  
<kicanvas-embed controls="full">
<kicanvas-source src="image/doom_v1.kicad_sch"></kicanvas-source>
<kicanvas-source src="image/doom_v1.kicad_pcb"></kicanvas-source>
</kicanvas-embed>
Utilisez shift+mollet, ctrl+mollet ou alt+mollet pour vous déplacez
Un menu est également disponible a droite afin de choisir la couche ou l'opacité des éléments 

## 4. Caractéristiques techniques

### a. Tension et consommation

La carte est alimentée par une **batterie Li-ion de 24 V**, d’une capacité de **3,5 Ah** pour une énergie totale de **84 Wh**. La batterie est reliée à la carte via un **relais commandé par un bouton d’arrêt d’urgence (BAU)**, garantissant une coupure immédiate de l’alimentation du robot en cas de besoin.

À partir de cette tension d’entrée, la carte génère les tensions nécessaires aux différents sous-ensembles du robot :
- **12 V**, utilisé principalement pour l’alimentation des actionneurs,
- **5 V**, destiné aux microcontrôleurs, aux servomoteurs, à certains périphériques et à la logique intermédiaire,
- **3,3 V**, dédié  module d'extension et aux circuits de communication.

Les actionneurs (moteurs pas à pas, servomoteurs et pompes) sont **alimentés directement par la carte**. Aucune protection active spécifique n’est intégrée au niveau de la puissance. La limitation des perturbations électriques repose principalement sur :
- la présence de **condensateurs de découplage** afin de limiter les pics de courant,
- des **diodes de protection** contre les retours de courant, notamment sur les charges inductives.

La consommation électrique de la carte est évaluée de manière globale, en distinguant une consommation nominale et une consommation maximale théorique.

**Hypothèses de calcul :**
- Les servomoteurs utilisés sont des **FS5109M**, pouvant consommer des courants élevés lors des phases de démarrage ou de blocage.
- Les moteurs pas à pas, servomoteurs et pompes ne sont pas tous activés simultanément à pleine charge.
- Le pilotage logiciel limite volontairement l’activation concurrente des actionneurs afin d’éviter des pics de courant susceptibles de provoquer une chute de tension.
- La consommation de la logique (microcontrôleurs, capteurs, communication) reste négligeable devant celle des actionneurs.

Dans ces conditions :
- la **consommation nominale** correspond à un scénario de match classique, avec une activation séquencée des actionneurs,
- la **consommation maximale théorique** correspond à un cas défavorable où plusieurs actionneurs sont sollicités simultanément.

Ces valeurs sont utilisées comme base de dimensionnement de l’alimentation et de la stratégie de gestion de la puissance.

### b. Interfaces de communication interne et externe

La communication interne de la carte repose sur **deux liaisons UART point à point** :
- une liaison entre le microcontrôleur principal et le microcontrôleur dédié aux capteurs,
- une liaison entre le microcontrôleur principal et le microcontrôleur dédié à la gestion des moteurs et des actionneurs.

Le microcontrôleur principal agit comme un **chef d’orchestre**, coordonnant l’ensemble des sous-systèmes, assurant la synchronisation des actions et la cohérence globale du fonctionnement du robot. Aucun débit spécifique n’est imposé à ces liaisons, celles-ci étant configurées en fonction des besoins du système.

La carte expose principalement un **bus I²C** vers l’extérieur afin de permettre l’ajout de cartes d’extension ou de capteurs supplémentaires. Les adresses I²C sont configurables à l’aide de **jumpers à souder**, permettant d’éviter les conflits d’adressage et de conserver une architecture flexible.

Un module de communication **XBee** peut également être ajouté de manière optionnelle via un connecteur dédié. Ce module est utilisé pour :
- la transmission d’informations vers un éventuel centre de calcul,
- le lancement du match (top départ),
- le paramétrage du robot avant match.

Le module XBee est entièrement **optionnel** et n’est pas critique pour le fonctionnement du robot en match. Son absence n’affecte pas le comportement nominal du système.

## 5. Liste des composants et assemblage
  - lien vers assemblage.md

## 6. Maintenance et dépannage
- Problèmes connus
- Remplacement de composants


## 7. Historique des versions
- Version de la carte
- Modifications
- Date
- Responsable
