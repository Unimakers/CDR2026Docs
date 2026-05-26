---
title: "Programation"
parent: "Pami Ninja"
layout: technical
---

# Programation

## Introduction

Ce code contrôle un robot mobile pour une compétition (type Coupe de Robotique / Eurobot).  
Il gère :

- Deux moteurs pas à pas avec driver (TMC2209 ou similaire)
- Un servo-moteur sur PCA9685
- Une pompe et une électrovanne via PCF8574
- Une tirette de démarrage
- Un interrupteur de côté (Jaune / Bleu)

Le robot exécute une stratégie autonome une fois la tirette retirée.

---

## Configuration Matérielle

### Broches ESP32

| Broche | Définition     | Fonction                          | Commentaire                  |
|--------|----------------|-----------------------------------|------------------------------|
| GPIO2  | `STEP_D`       | Step moteur droit                 |                              |
| GPIO1  | `DIR_D`        | Direction moteur droit            |                              |
| GPIO4  | `STEP_G`       | Step moteur gauche                |                              |
| GPIO3  | `DIR_G`        | Direction moteur gauche           |                              |
| GPIO9  | `EN_PIN`       | Enable moteurs                    | LOW = actif                  |
| GPIO8  | `TIRETTE`      | Tirette de démarrage              | LOW = présente               |
| GPIO7  | `SWITCH`       | Interrupteur côté                 | LOW = Jaune                  |

**I2C** : SDA = GPIO5 (D4), SCL = GPIO6 (D5)

### Périphériques I2C

- **PCA9685** : Adresse `0x40` → Contrôle du servo (canal 0 - J13)
- **PCF8574AT** : Adresse `0x20` → Contrôle Pompe + Électrovanne

---

## Bibliothèques Utilisées

```cpp
#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>