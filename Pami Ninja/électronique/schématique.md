---
title: "Schématiques"
layout: technical
grand_parent: Pami Ninja
parent: Électronique
has_children: false
---

# Conception du Schématique Électronique

## 1. Présentation générale

Avant de dessiner physiquement la carte (le PCB), on a réalisé le **schématique** sur le logiciel **KiCad**. Cette étape constitue le plan logique du circuit, permettant de définir les composants à utiliser ainsi qu'à visualiser les différentes connexions entre eux.

Pour garantir la fiabilité du système, on s'est appuyé sur la documentation des anciennes cartes de l'association ainsi que sur l'accompagnement des professeurs du MakerSpace.

## 2. Architecture du circuit 

Pour rendre le schéma plus clair et modulaire, on a fait le choix de le découper en plusieurs blocs fonctionnels. Chacun a un rôle précis dans le fonctionnement du PAMI Ninja :

* **Batterie :** Ce bloc gère l'arrivée directe de l'énergie. C'est le point d'entrée de la puissance générale de la carte qui sera ensuite distribuée et régulée.
* **Microcontrôleur :** Bien qu'il ne soit pas enfermé dans un bloc visuel, c'est le cœur du système (basé sur un module ESP32). Il centralise toutes les connexions logiques : il exécute le programme de match, traite les données reçues des capteurs et donne les ordres d'action.
* **Driveurs moteur pas à pas :** Cette partie gère l'interface de puissance pour les mouvements. Elle permet au microcontrôleur de piloter les moteurs des roues avec précision pour assurer les déplacements du robot sur le plateau.
* **Pompe :** Ce bloc est dédié spécifiquement à la gestion du système de la pompe de notre robot. Il commande l'activation de la pompe nécessaire à la préhension des caisses de noisettes par la ventouse.
* **Actionneurs :** Ce bloc regroupe la commande des autres éléments mécaniques mobiles, comme le capteur à ultrasaon qui permets de détecter si quelque chose se rapproche afin d'éviter toute collision ou comme la tirette qui nous permettra de mettre en route nos robots à chaque début de match.
* **Extensions :** Ce bloc permet d'ajouter des fonctionnalités supplémentaires ou des capteurs externes comme le servo moteur permettant de gérer l'inclinaison du bras. Il offre une flexibilité pour faire évoluer le robot sans modifier le cœur de la carte.

## 3. Réflexion technique

L'étude des versions précédentes a mis en avant l'importance d'avoir un schéma propre et bien compartimenté. Cette organisation permet de ne pas surcharger la vue globale et de limiter les erreurs de câblage lors de la conception.

Grâce aux conseils des professeurs, on a pu s'assurer que l'isolation entre les blocs de puissance et la logique était bien respectée. Cette rigueur dans la conception du schématique est indispensable pour que le robot soit robuste et qu'il ne subisse pas d'interférences durant les 90 secondes de match.
