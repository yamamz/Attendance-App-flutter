import 'package:auto_route/auto_route_annotations.dart';
import 'package:class_room_app/feature/attendance/presentation/pages/attendance_page.dart';
import 'package:class_room_app/feature/attendance/presentation/pages/manage_attendance_page.dart';
import 'package:class_room_app/feature/generate_qr/presentation/pages/generate_qr_page.dart';
import 'package:class_room_app/feature/home/presentation/pages/home.dart';
import 'package:class_room_app/feature/student/presentation/pages/add_edit_student_page.dart';
import 'package:class_room_app/feature/student/presentation/pages/student_page.dart';
import 'package:class_room_app/feature/subject/presentation/pages/add_student_list.dart';
import 'package:class_room_app/feature/subject/presentation/pages/add_subject_page.dart';
import 'package:class_room_app/feature/subject/presentation/pages/subject_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: Home, initial: true),
    MaterialRoute(page: AttendancePage),
    MaterialRoute(page: ManageAttendancePage),
    MaterialRoute(page: GenerateQrPage),
    MaterialRoute(page: StudentPage),
    MaterialRoute(page: AddEditStudentPage),
    MaterialRoute(page: AddStudentList),
    MaterialRoute(page: AddSubjectPage),
    MaterialRoute(page: SubjectPage),
  ],
)
class $Router {}
