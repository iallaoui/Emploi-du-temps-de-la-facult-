import '../entities/course_session.dart';
import '../entities/schedule_change.dart';

/// Backend boundary used by the application without exposing Firestore types.
abstract interface class TimetableRepository {
  Stream<List<CourseSession>> watchWeeklyTimetable({
    required String filiereId,
    required String semestreId,
    required String groupeId,
  });

  Stream<List<ScheduleChange>> watchScheduleChanges({
    required String groupeId,
    required DateTime du,
    required DateTime au,
  });

  Stream<List<CourseSession>> watchTeacherSessions(String enseignantUid);

  Future<String> createSession(CourseSession session);

  Future<void> updateSession(CourseSession session);

  Future<void> deleteSession(String sessionId);

  Future<String> createScheduleChange(ScheduleChange change);

  Future<void> updateScheduleChange(ScheduleChange change);

  Future<void> deleteScheduleChange(String changeId);
}
