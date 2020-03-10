import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';

abstract class AttendanceRepository {
  Future<AttendanceEntity> saveAttendance(AttendanceEntity attendanceEntity);
  Future<AttendanceEntity> updateAttendance(UpdateAttendanceParams params);
  Future<List<AttendanceEntity>> getAttendances();
}
