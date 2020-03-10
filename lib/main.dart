import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/presentation/state/attendance_store.dart';
import 'package:class_room_app/feature/home/presentation/pages/home.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:class_room_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'feature/student/domain/entities/student_entity.dart';
import 'feature/subject/domain/entities/subject_entity.dart';
import 'injection.dart' as inject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(StudentEntityAdapter());
  Hive.registerAdapter(SubjectEntityAdapter());
  Hive.registerAdapter(AttendanceEntityAdapter());
  configureInjection(Env.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        accentColor: Colors.blue,
        cursorColor: PRIMARY_COLOR,
        toggleableActiveColor: PRIMARY_COLOR,
        primaryColor: PRIMARY_COLOR,
      ),
      home: Injector(
        inject: [
          Inject<StudentStore>(
            () => inject.getIt<StudentStore>(),
          ),
          Inject<SubjectStore>(
            () => inject.getIt<SubjectStore>(),
          ),
          Inject<AttendanceStore>(
            () => inject.getIt<AttendanceStore>(),
          ),
        ],
        builder: (context) => Home(),
      ),
    );
  }
}
