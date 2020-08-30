import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: ['prod'])
class AttendanceDao {
  String boxName = 'attendances';

  Future<AttendanceEntity> insert(AttendanceEntity attendanceEntity) async {
    var box = await Hive.openBox<AttendanceEntity>(boxName);
    final int key = await box.add(attendanceEntity);
    return box.get(key);
  }

  Future<AttendanceEntity> update(
      UpdateAttendanceParams updateAttendanceParams) async {
    var box = await Hive.openBox<AttendanceEntity>(boxName);
    await box.put(
        updateAttendanceParams.key, updateAttendanceParams.attendanceEntity);
    return box.get(updateAttendanceParams.key);
  }

  Future<bool> delete(int id) async {
    var box = await Hive.openBox<AttendanceEntity>(boxName);
    await box.deleteAt(id);
    return true;
  }

  Future<List<AttendanceEntity>> getAllSortedByName() async {
    var box = await Hive.openBox<AttendanceEntity>(boxName);
    return box.values.toList();
  }
}
