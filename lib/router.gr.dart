// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'feature/attendance/domain/entities/attendance_entity.dart';
import 'feature/attendance/presentation/pages/attendance_page.dart';
import 'feature/attendance/presentation/pages/manage_attendance_page.dart';
import 'feature/generate_qr/presentation/pages/generate_qr_page.dart';
import 'feature/home/presentation/pages/home.dart';
import 'feature/student/domain/entities/student_entity.dart';
import 'feature/student/presentation/pages/add_edit_student_page.dart';
import 'feature/student/presentation/pages/student_page.dart';
import 'feature/subject/domain/entities/subject_entity.dart';
import 'feature/subject/presentation/pages/add_student_list.dart';
import 'feature/subject/presentation/pages/add_subject_page.dart';
import 'feature/subject/presentation/pages/subject_page.dart';

class Routes {
  static const String home = '/';
  static const String attendancePage = '/attendance-page';
  static const String manageAttendancePage = '/manage-attendance-page';
  static const String generateQrPage = '/generate-qr-page';
  static const String studentPage = '/student-page';
  static const String addEditStudentPage = '/add-edit-student-page';
  static const String addStudentList = '/add-student-list';
  static const String addSubjectPage = '/add-subject-page';
  static const String subjectPage = '/subject-page';
  static const all = <String>{
    home,
    attendancePage,
    manageAttendancePage,
    generateQrPage,
    studentPage,
    addEditStudentPage,
    addStudentList,
    addSubjectPage,
    subjectPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.attendancePage, page: AttendancePage),
    RouteDef(Routes.manageAttendancePage, page: ManageAttendancePage),
    RouteDef(Routes.generateQrPage, page: GenerateQrPage),
    RouteDef(Routes.studentPage, page: StudentPage),
    RouteDef(Routes.addEditStudentPage, page: AddEditStudentPage),
    RouteDef(Routes.addStudentList, page: AddStudentList),
    RouteDef(Routes.addSubjectPage, page: AddSubjectPage),
    RouteDef(Routes.subjectPage, page: SubjectPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Home(),
        settings: data,
      );
    },
    AttendancePage: (data) {
      final args = data.getArgs<AttendancePageArguments>(
        orElse: () => AttendancePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AttendancePage(
          key: args.key,
          subjectEntity: args.subjectEntity,
          attendanceEntity: args.attendanceEntity,
        ),
        settings: data,
      );
    },
    ManageAttendancePage: (data) {
      final args = data.getArgs<ManageAttendancePageArguments>(
        orElse: () => ManageAttendancePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ManageAttendancePage(key: args.key),
        settings: data,
      );
    },
    GenerateQrPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GenerateQrPage(),
        settings: data,
      );
    },
    StudentPage: (data) {
      final args = data.getArgs<StudentPageArguments>(
        orElse: () => StudentPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => StudentPage(key: args.key),
        settings: data,
      );
    },
    AddEditStudentPage: (data) {
      final args = data.getArgs<AddEditStudentPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddEditStudentPage(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    AddStudentList: (data) {
      final args = data.getArgs<AddStudentListArguments>(
        orElse: () => AddStudentListArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddStudentList(
          key: args.key,
          selectedStudents: args.selectedStudents,
        ),
        settings: data,
      );
    },
    AddSubjectPage: (data) {
      final args = data.getArgs<AddSubjectPageArguments>(
        orElse: () => AddSubjectPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddSubjectPage(
          key: args.key,
          subjectEntity: args.subjectEntity,
          index: args.index,
        ),
        settings: data,
      );
    },
    SubjectPage: (data) {
      final args = data.getArgs<SubjectPageArguments>(
        orElse: () => SubjectPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubjectPage(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AttendancePage arguments holder class
class AttendancePageArguments {
  final Key key;
  final SubjectEntity subjectEntity;
  final AttendanceEntity attendanceEntity;
  AttendancePageArguments(
      {this.key, this.subjectEntity, this.attendanceEntity});
}

/// ManageAttendancePage arguments holder class
class ManageAttendancePageArguments {
  final Key key;
  ManageAttendancePageArguments({this.key});
}

/// StudentPage arguments holder class
class StudentPageArguments {
  final Key key;
  StudentPageArguments({this.key});
}

/// AddEditStudentPage arguments holder class
class AddEditStudentPageArguments {
  final Key key;
  final String title;
  AddEditStudentPageArguments({this.key, @required this.title});
}

/// AddStudentList arguments holder class
class AddStudentListArguments {
  final Key key;
  final List<StudentEntity> selectedStudents;
  AddStudentListArguments({this.key, this.selectedStudents});
}

/// AddSubjectPage arguments holder class
class AddSubjectPageArguments {
  final Key key;
  final SubjectEntity subjectEntity;
  final int index;
  AddSubjectPageArguments({this.key, this.subjectEntity, this.index});
}

/// SubjectPage arguments holder class
class SubjectPageArguments {
  final Key key;
  SubjectPageArguments({this.key});
}
