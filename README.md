# FSO Emploi du temps

Structure de départ pour l’application mobile **Emploi du temps de la
faculté**, sujet n°20 du mini-projet Développement Mobile 2026–2027.

> Ce dépôt contient seulement l’architecture, les fichiers vides avec `TODO`
> et l’organisation du travail. L’application Flutter n’est pas encore
> initialisée ni développée.

## Objectif

L’application devra permettre aux étudiants de la Faculté des Sciences
d’Oujda de :

- choisir leur filière et leur groupe ;
- consulter leur emploi du temps par jour ou par semaine ;
- voir les changements de salle ;
- recevoir des notifications ;
- consulter le planning hors connexion.

## Architecture des fichiers

L’architecture respecte les trois couches demandées dans le sujet :
`data`, `domain` et `presentation`.

```text
.
├── assets/
│   └── images/
├── docs/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   └── app.dart
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_constants.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── utils/
│   ├── data/
│   │   ├── datasources/
│   │   │   └── timetable_local_data_source.dart
│   │   ├── models/
│   │   │   └── course_session_model.dart
│   │   └── repositories/
│   │       └── timetable_repository_impl.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── course_session.dart
│   │   ├── repositories/
│   │   │   └── timetable_repository.dart
│   │   └── usecases/
│   │       └── get_timetable.dart
│   └── presentation/
│       ├── controllers/
│       │   └── timetable_controller.dart
│       ├── pages/
│       │   ├── announcements_page.dart
│       │   ├── home_page.dart
│       │   ├── settings_page.dart
│       │   └── timetable_page.dart
│       └── widgets/
│           ├── course_card.dart
│           └── day_selector.dart
└── test/
```

### Rôle des couches

- `presentation/` : écrans, composants et gestion de l’état de l’interface.
- `domain/` : entités, règles métier et contrats indépendants de Flutter.
- `data/` : modèles, SQLite/API et implémentations des repositories.
- `core/` : thème, constantes et utilitaires partagés.

## Répartition du travail entre quatre personnes

La majorité des tâches est consacrée au frontend. Remplacer les noms
temporaires par les noms réels de l’équipe.

| Membre | Responsabilité | Travail prévu | Part |
|---|---|---|---:|
| **Membre 1** | UI/UX et composants | Maquettes Figma, thème, couleurs, typographie, navigation, écran d’accueil, composants réutilisables et responsive design | 25 % |
| **Membre 2** | Frontend du planning | Écrans jour/semaine, calendrier, filtres filière/groupe, cartes et détails des cours, états vide/chargement/erreur | 25 % |
| **Membre 3** | Frontend annonces et paramètres | Écrans annonces, changements de salle, notifications, paramètres, préférences et accessibilité | 25 % |
| **Membre 4** | Données et intégration | Entités, repositories, SQLite, notifications locales, raccordement aux écrans, tests et génération de l’APK | 25 % |

### Ordre conseillé

1. Le membre 1 prépare les maquettes et les composants communs.
2. Les membres 2 et 3 développent leurs écrans en parallèle.
3. Le membre 4 définit les contrats du domaine et la persistance.
4. Toute l’équipe intègre, teste et corrige l’application.

## Branches Git proposées

```text
main
develop
feature/ui-design-system
feature/timetable-ui
feature/announcements-settings-ui
feature/data-notifications
```

Chaque fonctionnalité doit passer par une pull request vers `develop`. Le
sujet demande au moins **15 commits significatifs**, répartis entre les
membres. Aucune clé API ou mot de passe ne doit être ajouté au dépôt.

## Technologies prévues

- Flutter stable et Dart 3 ;
- Material 3 ;
- `table_calendar` pour le calendrier ;
- `sqflite` pour les données locales ;
- `flutter_local_notifications` pour les notifications ;
- une seule solution de gestion d’état, choisie par l’équipe.

Ces dépendances ne sont pas encore installées.

## Prochaines étapes

1. Initialiser Flutter dans cette structure.
2. Ajouter `pubspec.yaml` et les dépendances choisies.
3. Remplacer progressivement les commentaires `TODO` par le code.
4. Ajouter les maquettes et captures dans `docs/` et `assets/images/`.
5. Écrire les tests puis générer l’APK final.

## Dates du sujet

| Jalon | Date | Attendu |
|---|---|---|
| Prototype | 04/11/2026 | Navigation et au moins 50 % des fonctionnalités |
| Version bêta | 02/12/2026 | Fonctionnalités, persistance et premiers tests |
| Dépôt final | 01/01/2027 à 00h00 | Code, APK, rapport, vidéo et présentation |

## Auteurs

- Membre 1 — `Nom Prénom`
- Membre 2 — `Nom Prénom`
- Membre 3 — `Nom Prénom`
- Membre 4 — `Nom Prénom`
