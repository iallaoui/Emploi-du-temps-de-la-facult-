import '../entities/announcement.dart';

abstract interface class AnnouncementRepository {
  Stream<List<Announcement>> watchPublishedAnnouncements(String groupeId);

  Stream<List<Announcement>> watchTeacherAnnouncements(String enseignantUid);

  Future<String> createAnnouncement(Announcement announcement);

  Future<void> updateAnnouncement(Announcement announcement);

  Future<void> deleteAnnouncement(String announcementId);
}
