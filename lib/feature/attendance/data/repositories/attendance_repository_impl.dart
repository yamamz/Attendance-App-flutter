import 'package:class_room_app/feature/attendance/data/datasources/attendance_local_data_source.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/repositories/attendance_repository.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(as: AttendanceRepository, env: ['prod'])
class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceLocalDataSource attendanceLocalDataSource;

  AttendanceRepositoryImpl({@required this.attendanceLocalDataSource});
  @override
  Future<List<AttendanceEntity>> getAttendances() async {
    return await attendanceLocalDataSource.getAttendances();
  }

  @override
  Future<AttendanceEntity> saveAttendance(
      AttendanceEntity attendanceEntity) async {
    return await attendanceLocalDataSource.saveAttendance(attendanceEntity);
  }

  @override
  Future<AttendanceEntity> updateAttendance(
      UpdateAttendanceParams params) async {
    return await attendanceLocalDataSource.updateAttendance(params);
  }
}
