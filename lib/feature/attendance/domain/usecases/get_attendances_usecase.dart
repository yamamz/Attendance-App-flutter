import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/repositories/attendance_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(env: ['prod'])
class GetAttendancesUsecase
    implements Usecase<List<AttendanceEntity>, NoParams> {
  final AttendanceRepository attendanceRepository;
  GetAttendancesUsecase({@required this.attendanceRepository});

  @override
  Future<List<AttendanceEntity>> call(NoParams params) async {
    return await attendanceRepository.getAttendances();
  }
}
