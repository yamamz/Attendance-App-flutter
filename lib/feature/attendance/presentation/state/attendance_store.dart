import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/get_attendances_usecase.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/save_attendance_usecase.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@Environment(Env.prod)
class AttendanceStore {
  final SaveAttendanceUsecase saveAttendanceUsecase;
  final GetAttendancesUsecase getAttendancesUsecase;
  final UpdateAttendanceUsecase updateAttendanceUsecase;

  AttendanceStore({
    @required this.saveAttendanceUsecase,
    @required this.getAttendancesUsecase,
    this.updateAttendanceUsecase,
  });

  List<AttendanceEntity> _attendances;

  List<AttendanceEntity> get attendance => _attendances;

  void saveAttendance(AttendanceEntity attendanceEntity) async {
    await saveAttendanceUsecase(attendanceEntity);
  }

  void getAttendances() async {
    _attendances = await getAttendancesUsecase(NoParams());
  }

  void updateAttendance(UpdateAttendanceParams updateAttendanceParams) async {
    await updateAttendanceUsecase(updateAttendanceParams);
  }
}
