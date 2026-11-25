enum TypeModificationSeance {
  changementSalle,
  annulation,
  report,
  seanceSupplementaire,
}

/// A date-specific exception applied to a recurring course session.
class ScheduleChange {
  const ScheduleChange({
    required this.id,
    required this.seanceId,
    required this.enseignantUid,
    required this.filiereId,
    required this.semestreId,
    required this.groupeId,
    required this.dateConcernee,
    required this.typeModification,
    required this.nouvelleSalle,
    required this.nouvelleMinuteDebut,
    required this.nouvelleMinuteFin,
    required this.motif,
    required this.estPublie,
    required this.creeLe,
    required this.modifieLe,
  });

  final String id;
  final String seanceId;
  final String enseignantUid;
  final String filiereId;
  final String semestreId;
  final String groupeId;
  final DateTime dateConcernee;
  final TypeModificationSeance typeModification;
  final String nouvelleSalle;

  /// A value of -1 means that the original session time is unchanged.
  final int nouvelleMinuteDebut;

  /// A value of -1 means that the original session time is unchanged.
  final int nouvelleMinuteFin;
  final String motif;
  final bool estPublie;
  final DateTime creeLe;
  final DateTime modifieLe;
}
