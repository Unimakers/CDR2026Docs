---
title: "La conception de la carte"
parent: Elec
layout: technical
---
# La conception de la carte

## 1. Introduction à la conception

Cette section a pour objectif de présenter les principes et choix ayant guidé la conception de la carte électronique du robot. Elle se concentre exclusivement sur les aspects liés à la **conception matérielle et architecturale** de la carte, indépendamment de son utilisation ou de son intégration logicielle, qui sont traitées dans d’autres documents.

La carte a été conçue dans le cadre de la Coupe de France de Robotique, avec pour objectif principal de constituer une solution **fiable, compacte et pérenne**, capable d’être réutilisée sur plusieurs années sans modification majeure. Les contraintes mécaniques du robot étant volontairement figées sur le long terme, la conception de la carte s’inscrit dans cette logique de stabilité et de durabilité.

Un choix structurant de cette conception est l’adoption d’une **architecture tout-en-un**. L’ensemble des fonctions auparavant réparties sur plusieurs cartes distinctes (traitement, capteurs, actionneurs, communication et alimentation) est regroupé sur une seule carte électronique. Cette approche vise à réduire la complexité globale du système, à limiter le câblage interne et à améliorer la fiabilité, en particulier dans un contexte de compétition où les vibrations, les chocs et les faux contacts sont des sources fréquentes de défaillance.

La conception repose également sur une **segmentation fonctionnelle claire**, matérialisée par l’utilisation de plusieurs microcontrôleurs spécialisés. Cette répartition permet de découpler les tâches critiques, de simplifier le développement et le débogage, et d’améliorer la robustesse globale du système, tout en conservant une vision centralisée du fonctionnement du robot.

Enfin, la carte a été pensée pour rester **évolutive et maintenable**. Des interfaces d’extension sont prévues afin de permettre l’ajout de fonctionnalités futures sans remise en cause de l’architecture existante. Les choix réalisés lors de la conception privilégient la lisibilité du schéma, la clarté du routage et l’accessibilité des composants critiques, afin de faciliter la compréhension, la maintenance et les évolutions ultérieures.

## 2. Schéma électronique

### a. Présentation du schéma global

Le schéma électronique a été réalisé sous **KiCad** et est volontairement regroupé sur **une seule feuille au format A2**. Ce choix a été fait afin de conserver une **vision globale immédiate** de l’ensemble de la carte, sans navigation entre plusieurs pages, ce qui facilite la compréhension, la relecture et la maintenance du schéma.

Le schéma est organisé en **blocs fonctionnels clairement délimités**, chaque bloc correspondant à une partie précise de la carte (alimentation, microcontrôleurs, drivers, communication, LED, connecteurs, etc.). Cette organisation visuelle permet d’identifier rapidement le rôle de chaque sous-ensemble tout en conservant une cohérence globale.

Les interconnexions entre les différents blocs sont réalisées à l’aide de **labels globaux**, limitant l’encombrement visuel et améliorant la lisibilité du schéma, tout en restant cohérentes avec le routage du PCB.

### b. Description par parties

#### Alimentation

L’alimentation de la carte repose sur une **distribution en 24/12/5/3.3 V**, qui constitue les tensions centrales du système. Ces tensions sont générées à partir de la batterie via des **convertisseurs de puissance** de type :
- **TSR 2433 / TSR 2450**
- **TEN 50-2411 / TEN 50-2412**

Un convertisseur est dédié spécifiquement à l’**alimentation de la logique**, afin d’assurer une tension stable pour les microcontrôleurs et les circuits de communication.

Les masses sont **communes**, ce qui simplifie la conception tout en assurant une référence électrique cohérente sur l’ensemble de la carte.

Le découplage est principalement assuré **au plus proche des charges**, notamment au niveau des moteurs pas à pas, des servomoteurs et des pompes, afin de limiter les effets des appels de courant et des perturbations générées par les charges inductives.

#### Traitement

La partie traitement repose sur **trois microcontrôleurs** de type **XIAO ESP32-S3** :
- deux XIAO ESP32-S3+,
- un XIAO ESP32-S3.

Chaque microcontrôleur dispose de ses propres lignes de **reset et de boot**, permettant une programmation et un débogage indépendants.

L’alimentation des microcontrôleurs est assurée par le convertisseur dédié à la logique, garantissant une tension stable et isolée des perturbations liées à la puissance.

Même si la hiérarchie maître/esclave n’est pas explicitement matérialisée sur le schéma, les liaisons internes et le découpage fonctionnel traduisent le rôle central du microcontrôleur principal dans la coordination du système.

#### Communication

Les communications internes reposent sur des **liaisons UART point à point**, représentées sur le schéma à l’aide de **labels globaux**, reliant le microcontrôleur principal aux microcontrôleurs dédiés aux capteurs et aux actionneurs.

Un **bus I²C** est également présent et clairement identifié par des labels. Les résistances de **pull-up I²C sont intégrées directement sur la carte**, ce qui permet une utilisation immédiate du bus sans ajout externe.

La communication sans fil est rendue possible par un **module XBee optionnel**, connecté via un **connecteur câblé**. Ce module n’est pas indispensable au fonctionnement du robot, mais permet la transmission d’informations et le paramétrage avant match.

Les interfaces de communication et les connecteurs externes sont regroupés dans des zones dédiées du schéma, facilitant leur identification et leur intégration sur le PCB.

#### Puissance

La partie puissance inclut la gestion directe des actionneurs du robot. Les **moteurs pas à pas** sont pilotés par des **drivers TMC2209**, intégrés directement sur la carte. Ce choix a été motivé par :
- la simplicité d’utilisation,
- les habitudes de l’équipe,
- le fonctionnement silencieux de ces drivers.

Les **servomoteurs et les pompes** sont commandés directement par la carte, sans étage intermédiaire spécifique. Aucune protection active dédiée aux charges inductives n’est intégrée, la conception reposant principalement sur le découplage et la gestion logicielle des activations.

Les éléments de puissance sont regroupés dans des zones dédiées du schéma, clairement séparées des parties logiques et de communication, afin de limiter les interactions et de faciliter la compréhension de l’architecture.

### c. Choix des composants principaux

#### Microcontrôleurs

Le choix des XIAO ESP32-S3 repose principalement sur les **habitudes de l’équipe** ainsi que sur la **disponibilité du matériel** déjà possédé par l’association. L’utilisation de trois microcontrôleurs permet d’augmenter le nombre de cœurs disponibles et de **programmer chaque microcontrôleur indépendamment**, ce qui simplifie la compréhension, le développement et le débogage du code.

Ces microcontrôleurs sont considérés comme **critiques** dans la conception, leur défaillance entraînant l’arrêt du système.

#### Drivers moteurs

Les drivers **TMC2209** ont été sélectionnés pour leur facilité d’intégration, leur fiabilité et leur fonctionnement silencieux. Ils sont directement implantés sur la carte afin de réduire le câblage et d’améliorer la robustesse globale du système.

#### Écran

L’interface utilisateur repose sur un **écran tactile TFT utilisant une communication SPI**. L’écran ne génère pas de contrainte particulière au niveau du schéma électronique et reste **optionnel**. En cas d’absence ou de défaillance de l’écran, le système peut fonctionner en mode dégradé grâce aux boutons physiques prévus sur la carte.


## 3. Conception du PCB

### a. Dimensions et forme de la carte
- Forme générale de la carte
- Dimensions
- Contraintes d’intégration mécanique
- Orientation dans le robot

### b. Règles de routage spécifiques
- Organisation générale du routage
- Autoroute centrale pour les signaux
- Gestion et continuité du plan de masse
- Séparation des zones de puissance
- Zone dédiée au **24 V**

### c. Placement des composants critiques
- Écran
- Microcontrôleurs
- Connecteurs d’extension I²C
- Justification des placements

### d. Connecteurs
- Connecteurs servomoteurs
- Connecteurs GPIO
- Connecteurs d’extension
- Connecteur d’alimentation
- Choix des types de connecteurs