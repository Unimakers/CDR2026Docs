---
title: "Pami Ninja"
layout: technical
nav_order: 1
has_children: true
---

# Présentation Technique : Le PAMI Ninja (Saison 2026)

## 1. Introduction
Le **PAMI Ninja** (Petit Actionneur Mobile Indépendant) est une unité robotique autonome auxiliaire conçue pour opérer spécifiquement dans la zone surélevée du terrain : **le Grenier**. 

Complémentaire au robot principal, il joue un rôle stratégique crucial en manipulant les ressources en hauteur pour maximiser le score de l'équipe grâce à sa grande agilité et son système de préhension par le vide.

---

## 2. Missions et Objectifs Stratégiques
Le PAMI Ninja est spécialisé dans la manipulation de haute précision en espace restreint. Ses objectifs sont hiérarchisés comme suit :

* **Libération des ressources :** Vidage des quatre "frigos" du grenier pour rendre les caisses de noisettes accessibles aux robots au sol.
* **Substitution symbolique :** Remplissage des frigos avec des caisses vides (noires) récupérées dans les zones de chargement.
* **Action finale "À table !" :** En fin de match, ralliement du garde-manger pour valider les points d'occupation ou activation du mécanisme symbolique.

---

## 3. Spécifications et Contraintes
Pour garantir son homologation, le PAMI Ninja respecte strictement les limites fixées par le règlement de la CDR 2026 :

### 3.1 Gabarit et Mobilité
* **Configuration au départ :**
    * Périmètre max : **600 mm**
    * Hauteur max : **150 mm**
* **Configuration en match (déployé) :**
    * Périmètre max : **700 mm**
    * Hauteur max : **350 mm**

### 3.2 Caractéristiques Physiques
* **Masse :** Limite stricte de **1,5 kg**.
* **Énergie :** Alimentation autonome avec protection intégrée pour batterie LiPo.
* **Intelligence :** Système d'évitement d'obstacles embarqué et autonomie décisionnelle totale.

---

## 4. Environnement de Jeu et Valorisation
Le PAMI Ninja évolue dans un écosystème spécifique où chaque action est déterminante pour le score final.

### 4.1 Zone d'évolution
* **Le Grenier :** Une surface de 45 \ 180 cm interdite aux robots principaux.
* **Zone de départ :** Un carré de 20 \ 20 cm situé en hauteur, imposant un design compact dès le déploiement.

### 4.2 Barème de points (Extraction & Remplissage)
**Calcul des points :**
* Chaque frigo vidé : **+2 points**
* Chaque frigo rempli (caisses vides) : **+5 points**

*Note : Ces points sont comptabilisés pour les deux équipes lors du bilan de fin de match.*

---

## 5. Architecture de l'Unité
Le robot est décomposé en trois modules principaux détaillés dans cette documentation :
1.  **Mécanique :** Châssis modulaire MakerBeam et système de ventouse.
2.  **Électronique :** Gestion de la puissance et capteurs de proximité.
3.  **Programmation :** Algorithmes de navigation et logique d'état.