---
title: "Actionneurs"
layout: technicalS
grand_parent: Pami Ninja
parent: Mécanique
has_children: false
---

# Section actionneur : bras ventouse

## 1. Présentation générale 

L'actionneur principal du *PAMI* est conçu pour la manipulation rapide et sécurisée des caisses de noisettes. Pour maximiser l'efficacité lors des matchs, nous avons opté pour un système de préhension par le vide monté sur un *bras articulé*. Ce choix permet une saisie robuste malgré les vibrations du robot, tout en conservant une grande simplicité de pilotage logiciel (tout ou rien pour la pompe).

## 2. Architecture mécanique 

Le système se compose d'un bras à segment, permettant une grande liberté de mouvement tout en restant dans le périmètre de départ du PAMI (150x150mm).

**Le Bras :** Articulé via un servomoteur, permettant d'ajuster l'inclinaison pour atteindre les caisses.

**La tête :** Une pièce imprimée en 3D permettant de supporter une ventouse, elle est creusée par un scillion amenant l'air à cette dernière. L'étanchéité interne est assurée par une épaisseur de paroi augmentée lors de l'impression.

**La ventouse :** L'utilisation d'un seule ventouse souple permet de prendre la caisse en s'adaptant aux éventuels défauts de parallélisme entre le robot et la cible.

Le bras vient acceuillir en son creux un tuyau reliant la ventouse à la pompe. Le tuyau esr donc protégé des élements extérieurs pour éviter qu'il se décroche ou qu'il ne s'emmêle dans la structure en profilés lors des mouvements.

## 3. Système pneumatique

La dépression est générée par une micro-pompe à vide logée au centre du châssis. 

Le circuit est volontairement court pour réduire le volume d'air à pomper, ce qui permet une préhension quasi instantanée dès que la ventouse entre en contact avec la paroi de la caisse.
