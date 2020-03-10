import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/repositories/attendance_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
@Environment(Env.prod)
class SaveAttendanceUsecase implements Usecase<AttendanceEntity, AttendanceEntity> {
  final AttendanceRepository attendanceRepository;

  SaveAttendanceUsecase({@required this.attendanceRepository});
  @override
  Future<AttendanceEntity> call(AttendanceEntity params) async {
    return await attendanceRepository.saveAttendance(params);
  }
}
