import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:hive/hive.dart';
part 'attendance_entity.g.dart';

@HiveType(typeId: 2)
class AttendanceEntity extends HiveObject {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final SubjectEntity subjectEntity;
  @HiveField(2)
  final List<Map> attendanceEntries;
  AttendanceEntity({this.date, this.subjectEntity, this.attendanceEntries});
}
