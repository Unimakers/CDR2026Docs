---
title: "Base roulante"
layout: technical
grand_parent: Pami Ninja
parent: Mécanique
---

# Section Mécanique : Base Roulante

## 1. Philosophie de conception
La base roulante du **PAMI Ninja** a été conçue pour offrir un compromis idéal entre **rigidité structurelle**, **précision de déplacement** et **accessibilité technique**. 

Initialement, nous avions envisagé un châssis monobloc en impression 3D. Cependant, pour faciliter l'intégration des composants et la maintenance sur le terrain, nous avons opté pour une structure modulaire en **MakerBeam**.

<model-viewer alt="premier prototype" src="Unimakers/CDR2026Docs/Pami Ninja/model/premier prototype.gltf" ar style="width:80%; height:400px" shadow-intensity="1" camera-controls min-field-of-view="2deg"></model-viewer>


---

## 2. Structure et Châssis
Le squelette du robot repose sur des profilés en aluminium de $10 \times 10$ mm (MakerBeam).

### 2.1 Avantages du système MakerBeam
* **Modularité :** Permet d'ajuster la position des capteurs et des supports sans réimprimer de pièces.
* **Robustesse :** L'aluminium offre une rigidité bien supérieure au plastique face aux collisions éventuelles.
* **Maintenance :** Les faces en acrylique sont fixées via des **vis à tête carrée** glissées dans les rainures et maintenues par des écrous standards. 

> **Accessibilité :** Chaque face est démontable en dévissant simplement 8 écrous, permettant un accès complet à l'électronique interne en moins de 30 secondes sans fragiliser la structure porteuse.

---

## 3. Motorisation et Cinématique
La base utilise une configuration à deux roues motrices classiques avec des moteurs pas-à-pas.

| Composant | Détails techniques |
| :--- | :--- |
| **Moteurs** | Moteurs pas-à-pas (Stepper) pour une précision millimétrée |
| **Transmission** | Montage en **prise directe** sur l'axe moteur (évite le backlash) |
| **Type de roues** | Roues classiques à haute adhérence |
| **Support** | Fixation directe sur la plaque inférieure du châssis |



### 3.1 Intégration du système de préhension
La face avant présente une particularité : un évidement a été pratiqué dans la MakerBeam supérieure. Ce passage est dédié au **mécanisme de la ventouse**, permettant au bras et au tuyau de vide de se déployer vers l'extérieur pour manipuler les éléments de jeu.

---

## 4. Analyse de Masse et Stabilité
L'un des défis majeurs pour un PAMI est sa stabilité lors des phases d'accélération et de freinage brusques.

* **Centre de Gravité bas :** En fixant les moteurs (les composants les plus lourds) directement sur la plaque inférieure, nous abaissons au maximum le centre de gravité.
* **Répartition des masses :** Le choix de l'aluminium pour le cadre et de l'acrylique pour les parois permet de garder une structure légère en périphérie tout en concentrant le poids au niveau du plancher.
* **Impact dynamique :** Cette configuration réduit le moment d'inertie et limite l'effet de "tangage" lors des changements de direction, garantissant que la ventouse reste alignée avec sa cible.