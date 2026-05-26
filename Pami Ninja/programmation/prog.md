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

C++


#define VITESSE_MOTEUR 800        // Microsecondes entre pas (plus bas = plus rapide)
#define NB_MINI_PAS 5

// Calibration odométrie (calibrée sur le terrain)
#define STEPS_PER_REV     3232
#define WHEEL_CIRC_CM     45.87f
#define WHEELBASE_CM      8.20f

#define CM_EN_PAS(cm)     ((int)((float)(cm) / WHEEL_CIRC_CM * STEPS_PER_REV))
#define DEG_EN_PAS(deg)   ((int)((float)(deg) / 360.0f * (float)M_PI * WHEELBASE_CM / WHEEL_CIRC_CM * STEPS_PER_REV))
```

# Fonctions de Contrôle

1. **Pompe et Électrovanne** (PCF8574)

    Le PCF8574 est en open-drain : écrire 0 = actif (LOW), écrire 1 = inactif.
    void pompeOn();
    void pompeOff();
    void evOn();
    void evOff();

2. **Servo** (PCA9685)

    #define SERVO_J13_CH 0
    #define SERVO_MIN 150
    #define SERVO_MAX 500
    void setServoAngle(int angle); // Angle entre 0 et 180°
    updateServoFromSwitch(); // Position selon l'interrupteur

3. **Mouvements de Base**

La fonction **rotate()** intègre une rampe d’accélération / décélération pour plus de fluidité et de précision.

* avancer(steps) / avancerCm(float cm)

* reculer(steps) / reculerCm(float cm)

* tournerDroite(steps) / pivoterDroite(float deg)

* tournerGauche(steps) / pivoterGauche(float deg)

* Stratégies
  Deux stratégies miroirs sont implémentées en fonction du coté sur lequel on était :

  * strategieJaune()

  * strategieBleu()

  Le choix est fait automatiquement selon l’état de l’interrupteur SWITCH.
  Chaque stratégie contient :

* Petite manœuvre de départ

* Séquence de déplacements précis (avances, reculs, rotations)

* Actions finales avec le servo

* Boucle infinie d’oscillation du servo en fin de match (effet visuel / signal)


## Fonction setup()

* Initialisation de la communication I2C (Wire.begin(5, 6))

* Configuration du PCA9685 (fréquence 50 Hz)

* Configuration des broches GPIO

* Scan complet du bus I2C (affiché dans le moniteur série)

* Mise à l’état initial : pompe et EV éteintes, servo à 90°

* Initialisation du PCF8574 (toutes sorties relâchées)


## Fonction loop()
Fonctionnement classique d’un robot de compétition :

1. Mise à jour continue de la position du servo selon l’interrupteur

2. Attente de la tirette

3. Détection du côté (Jaune ou Bleu)

4. Exécution de la stratégie correspondante

5. Attente de remise de la tirette pour permettre un nouveau départ