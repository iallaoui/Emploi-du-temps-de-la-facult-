enum TypeSeance { cours, td, tp, examen }

/// A weekly course slot that is valid during a defined academic period.
///
/// User-facing labels are translated into French by the presentation layer.
/// Domain and database identifiers deliberately remain language-neutral.
class CourseSession {
  const CourseSession({
    required this.id,
    required this.filiereId,
    required this.semestreId,
    required this.groupeId,
    required this.moduleId,
    required this.nomModule,
    required this.enseignantUid,
    required this.nomEnseignant,
    required this.salle,
    required this.typeSeance,
    required this.jourSemaine,
    required this.minuteDebut,
    required this.minuteFin,
    required this.dateDebutValidite,
    required this.dateFinValidite,
    required this.estPublie,
    required this.creeLe,
    required this.modifieLe,
  })  : assert(jourSemaine >= 1 && jourSemaine <= 7),
        assert(minuteDebut >= 0 && minuteDebut < 1440),
        assert(minuteFin > minuteDebut && minuteFin <= 1440);

  final String id;
  final String filiereId;
  final String semestreId;
  final String groupeId;
  final String moduleId;
  final String nomModule;
  final String enseignantUid;
  final String nomEnseignant;
  final String salle;
  final TypeSeance typeSeance;
  final int jourSemaine;
  final int minuteDebut;
  final int minuteFin;
  final DateTime dateDebutValidite;
  final DateTime dateFinValidite;
  final bool estPublie;
  final DateTime creeLe;
  final DateTime modifieLe;
}
