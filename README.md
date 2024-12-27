# Inception

## Description du projet
Inception consiste à construire une mini-infrastructure de services conteneurisés en utilisant Docker Compose.
Ce projet a pour objectif de vous familiariser avec la gestion de conteneurs Docker et la configuration d’une architecture
respectant des règles strictes d’isolation et d’organisation.

## Objectifs pédagogiques
Apprendre Docker et Docker Compose.
Comprendre et configurer une architecture logicielle modulaire.
Explorer des concepts de réseau et de stockage persistant dans un environnement conteneurisé.
Configurer des services web sécurisés via TLS.

## Infrastructure mise en place
L’infrastructure comprend les services suivants :
- NGINX : Serveur web configuré pour supporter uniquement TLSv1.2 ou TLSv1.3.
- WordPress : Gestionnaire de contenu alimenté par php-fpm, sans serveur web intégré.
- MariaDB : Base de données relationnelle utilisée pour stocker les données de WordPress.

Volumes persistants :
- Un volume pour la base de données WordPress.
- Un volume pour les fichiers du site WordPress.

Réseau Docker : Un réseau privé pour permettre la communication entre les conteneurs.

## Structure du projet
![INception](https://github.com/user-attachments/assets/e030f444-5586-46fd-8408-80520d7efe6a)
