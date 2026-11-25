# Architecture du backend et de la base de données

## Périmètre

Cette première phase définit le contrat de données, les permissions Firestore
et les interfaces du domaine. Elle ne contient ni écrans Flutter, ni appels
Firestore, ni authentification dans l'application.

L'interface utilisateur et le schéma métier Firestore utilisent un vocabulaire
français. Les mots réservés imposés par Firebase (`match`, `allow`, `read`,
`write`, `timestamp`, etc.) restent naturellement en anglais.

## Acteurs

### Étudiant

- Aucun compte n'est requis dans la première version.
- Il peut lire uniquement les données publiées.
- Il ne peut créer, modifier ou supprimer aucune donnée.

### Enseignant

- Il se connectera avec Firebase Authentication.
- Son document `enseignants/{uid}` utilise le même UID que Firebase Auth.
- Il peut gérer uniquement ses propres séances.
- Il peut cibler uniquement les groupes et modules qui lui sont attribués.

Les référentiels `filieres`, `semestres`, `groupes`, `modules` et `enseignants`
sont administrés depuis la console Firebase. Aucun client mobile ne peut les
modifier.

## Collections

### `filieres/{filiereId}`

| Champ | Type | Exemple |
|---|---|---|
| `code` | string | `SMI` |
| `nom` | string | `Sciences mathématiques et informatique` |
| `actif` | bool | `true` |

### `semestres/{semestreId}`

| Champ | Type | Exemple |
|---|---|---|
| `filiereId` | string | `smi` |
| `code` | string | `S5` |
| `nom` | string | `Semestre 5` |
| `anneeUniversitaire` | string | `2026-2027` |
| `actif` | bool | `true` |

### `groupes/{groupeId}`

| Champ | Type | Exemple |
|---|---|---|
| `filiereId` | string | `smi` |
| `semestreId` | string | `s5` |
| `code` | string | `G1` |
| `nom` | string | `Groupe 1` |
| `actif` | bool | `true` |

### `modules/{moduleId}`

| Champ | Type | Exemple |
|---|---|---|
| `filiereId` | string | `smi` |
| `semestreId` | string | `s5` |
| `code` | string | `DEV-MOBILE` |
| `nom` | string | `Développement mobile` |
| `actif` | bool | `true` |

### `enseignants/{uid}`

| Champ | Type | Signification |
|---|---|---|
| `prenom` | string | Prénom |
| `nom` | string | Nom |
| `email` | string | Adresse professionnelle |
| `groupesAutorises` | list<string> | Groupes autorisés |
| `modulesAutorises` | list<string> | Modules autorisés |
| `actif` | bool | Accès enseignant actif |

Ce document ne peut pas être créé ou modifié par l'enseignant lui-même.

### `seances/{seanceId}`

Une entrée représente une séance qui se répète chaque semaine. `jourSemaine`
utilise les valeurs 1 (lundi) à 7 (dimanche). Les heures sont stockées en
minutes après minuit, par exemple 08:30 devient 510.

Champs obligatoires : `filiereId`, `semestreId`, `groupeId`, `moduleId`,
`nomModule`, `enseignantUid`, `nomEnseignant`, `salle`, `typeSeance`,
`jourSemaine`, `minuteDebut`, `minuteFin`, `dateDebutValidite`,
`dateFinValidite`, `estPublie`, `creeLe`, `modifieLe`.

Valeurs de `typeSeance` : `COURS`, `TD`, `TP`, `EXAMEN`.

### `modificationsSeances/{modificationId}`

Une modification exceptionnelle liée à une date précise : changement de
salle, annulation, report ou séance supplémentaire.

Valeurs de `typeModification` : `SALLE_MODIFIEE`, `ANNULEE`, `REPORTEE`,
`SEANCE_SUPPLEMENTAIRE`.

`nouvelleMinuteDebut` et `nouvelleMinuteFin` valent `-1` lorsque l'heure ne
change pas. `nouvelleSalle` vaut une chaîne vide lorsque la salle ne change
pas.

### `annonces/{annonceId}`

Une annonce appartient à un enseignant. `groupesCibles` contient entre 1 et
20 groupes attribués à cet enseignant. Le client étudiant utilisera une
requête `array-contains` avec son groupe.

## Règles d'accès

| Ressource | Étudiant | Enseignant connecté |
|---|---|---|
| Référentiels actifs | Lecture | Lecture |
| Profil enseignant | Refus | Lecture de son profil |
| Séance publiée | Lecture | Lecture |
| Séance non publiée | Refus | Lecture |
| Modification d'une séance | Refus | Propriétaire uniquement |
| Changement publié | Lecture | Lecture |
| Modification d'un changement | Refus | Propriétaire uniquement |
| Annonce publiée | Lecture | Lecture |
| Modification d'une annonce | Refus | Auteur uniquement |

Toutes les routes non déclarées sont refusées par défaut.

> Les règles Firestore ne peuvent pas rechercher d'autres séances afin de
> garantir l'absence de chevauchement. La détection des conflits sera ajoutée
> dans une opération de validation de confiance pendant la phase 3. Dans la
> première version, les attributions de groupes/modules limitent déjà les
> séances qu'un enseignant peut gérer.

## Requêtes prévues

1. Emploi du temps étudiant : programme + semestre + groupe + publié + jour,
   trié par heure de début.
2. Séances enseignant : UID enseignant + période de validité + jour, triées
   par heure de début.
3. Changements : groupe + publié + intervalle de dates.
4. Annonces : groupe ciblé + publié, triées par date de publication.

Les index nécessaires à ces requêtes se trouvent dans
`firestore.indexes.json`.

## Phases suivantes

### Phase 2 - Connexion Firestore

- Modèles Firestore et conversion des `Timestamp`.
- Sources de données distantes.
- Implémentation des repositories.
- Initialisation Firebase et authentification enseignant.

### Phase 3 - Validation

- Données d'exemple réutilisables.
- Tests automatisés des règles avec l'émulateur Firebase.
- Tests des repositories.
- Documentation d'installation et de déploiement.
