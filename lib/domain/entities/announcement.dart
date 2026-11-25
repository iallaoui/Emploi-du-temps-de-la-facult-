/// A teacher announcement sent to one or more assigned student groups.
class Announcement {
  const Announcement({
    required this.id,
    required this.enseignantUid,
    required this.titre,
    required this.message,
    required this.filiereId,
    required this.semestreId,
    required this.groupesCibles,
    required this.estPublie,
    required this.publieLe,
    required this.expireLe,
    required this.creeLe,
    required this.modifieLe,
  });

  final String id;
  final String enseignantUid;
  final String titre;
  final String message;
  final String filiereId;
  final String semestreId;
  final List<String> groupesCibles;
  final bool estPublie;
  final DateTime publieLe;
  final DateTime expireLe;
  final DateTime creeLe;
  final DateTime modifieLe;
}
