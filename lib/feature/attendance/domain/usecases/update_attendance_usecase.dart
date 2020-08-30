import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/repositories/attendance_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(env: ['prod'])
class UpdateAttendanceUsecase
    implements Usecase<AttendanceEntity, UpdateAttendanceParams> {
  final AttendanceRepository attendanceRepository;

  UpdateAttendanceUsecase({@required this.attendanceRepository});
  @override
  Future<AttendanceEntity> call(UpdateAttendanceParams params) async {
    return await attendanceRepository.updateAttendance(params);
  }
}

class UpdateAttendanceParams {
  final AttendanceEntity attendanceEntity;
  final int key;

  UpdateAttendanceParams({this.attendanceEntity, this.key});
}
