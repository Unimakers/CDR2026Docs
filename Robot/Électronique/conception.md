---
title: "La conception de la carte"
parent: hidden
layout: technical
---
# La conception de la carte

## 1.Intro sur la conception

## 2. Schéma électronique

  ### a.Présentation du schéma global
  - choix de tout faire sur une seul feuille
  ### b. Description par parties :
  - les parties:
    - Alimentation
    - Traitement
    - Communication
    - Puissance
  ### c. Choix des composants principaux
  - les composants:
    - micro controlleur
    - driver
    - ecran


## 3. Conception du PCB

  ### a. Dimensions et forme de la carte
  - forme
  - taille
  - intégration mecanique
  
  ### b. Règles de routage spécifiques
  - autoroute centrale
  - passage de la masse
  - zone de 24v

  ### c. Placement des composants critiques
  - liste composants:
    - ecran
    - micro controlleurs
    - extension i2c
    
  ### d. Connecteurs
  - liste conn:
    - servo
    - gpio
    - extension
    - alim

# Documentation de conception – Carte électronique [Nom de la carte]

## 1. Introduction
- Objectif de la documentation
- Périmètre couvert (conception uniquement)
- Hypothèses de départ et contraintes générales

## 2. Cahier des charges de conception
- Fonctions à assurer
- Contraintes mécaniques
- Contraintes électriques
- Contraintes liées à la compétition
- Contraintes d’évolutivité et de maintenance

## 3. Architecture globale de la carte
- Vue d’ensemble de l’architecture
- Justification du choix multi-microcontrôleurs
- Répartition des rôles entre les microcontrôleurs
- Flux de données et de commandes

## 4. Choix des composants principaux
- Microcontrôleurs
- Drivers moteurs
- Régulateurs et convertisseurs de tension
- Interfaces de communication
- Composants critiques (précision, puissance)

## 5. Conception de l’alimentation
- Source d’alimentation
- Distribution des tensions
- Régulation (12 V / 5 V / 3,3 V)
- Gestion des pics de courant
- Découplage et filtrage
- Choix des protections passives

## 6. Gestion des actionneurs
- Pilotage des moteurs pas à pas
- Pilotage des servomoteurs
- Pilotage des pompes
- Contraintes de courant et de simultanéité
- Stratégies de limitation logicielle

## 8. Conception du schéma électronique
- Organisation du schéma
- Séparation des domaines (logique / puissance)
- Points sensibles et compromis
- Bonnes pratiques appliquées

## 9. Conception du PCB
- Nombre de couches et justification
- Placement des composants
- Séparation puissance / logique
- Règles de routage
- Gestion des masses
- Connecteurs et accessibilité

## 10. Contraintes mécaniques et thermiques
- Fixation de la carte
- Orientation dans le robot
- Ventilation et dissipation thermique
- Résistance aux vibrations et chocs

## 11. Fiabilité et robustesse
- Analyse des risques électriques
- Sources potentielles de défaillance
- Choix visant la robustesse
- Limitations connues de la conception

## 12. Évolutivité et maintenabilité
- Extensions prévues
- Points de modification faciles
- Compatibilité avec les versions futures
- Limites d’évolution

## 13. Validation de la conception
- Vérifications théoriques
- Points à tester lors de la fabrication
- Critères de validation

## 14. Historique et décisions de conception
- Décisions structurantes
- Alternatives envisagées
- Justification des choix finaux

## 15. Annexes
- Schémas complets
- Calculs détaillés
- Extraits de datasheets
- Références techniques
