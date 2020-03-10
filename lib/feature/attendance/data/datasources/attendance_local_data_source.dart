import 'package:class_room_app/core/data/dao/attendance_dao.dart';
import 'package:class_room_app/core/errors/exceptions.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';

abstract class AttendanceLocalDataSource {
  Future<AttendanceEntity> saveAttendance(AttendanceEntity attendanceEntity);
  Future<AttendanceEntity> updateAttendance(UpdateAttendanceParams params);
  Future<List<AttendanceEntity>> getAttendances();
}

@lazySingleton
@RegisterAs(AttendanceLocalDataSource)
@Environment(Env.prod)
class AttendanceLocalDataSourceImpl implements AttendanceLocalDataSource {
  final AttendanceDao attendanceDao;

  AttendanceLocalDataSourceImpl({this.attendanceDao});

  @override
  Future<AttendanceEntity> saveAttendance(AttendanceEntity attendanceEntity) async {
    try {
      return await attendanceDao.insert(attendanceEntity);
    } catch (_) {
      throw StoreException();
    }
  }

  @override
  Future<List<AttendanceEntity>> getAttendances() async {
    try {
      return await attendanceDao.getAllSortedByName();
    } catch (_) {
      throw StoreException();
    }
  }

  @override
  Future<AttendanceEntity> updateAttendance(UpdateAttendanceParams params) async {
    try {
      return await attendanceDao.update(params);
    } catch (_) {
      throw StoreException();
    }
  }
}
