// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:class_room_app/core/data/dao/student_dao.dart';
import 'package:class_room_app/core/data/dao/subject_dao.dart';
import 'package:dio/dio.dart';
import 'package:class_room_app/core/module.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:class_room_app/feature/subject/data/datasource/subject_local_datasource.dart';
import 'package:class_room_app/feature/subject/data/repository/subject_repository_impl.dart';
import 'package:class_room_app/feature/subject/domain/repository/subject_repository.dart';
import 'package:class_room_app/feature/subject/domain/usecases/get_subjects_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/save_subject_usecase.dart';
import 'package:class_room_app/feature/student/data/datasource/student_local_data_source.dart';
import 'package:class_room_app/feature/student/data/repository/student_repository_impl.dart';
import 'package:class_room_app/feature/student/domain/repository/student_repository.dart';
import 'package:class_room_app/feature/student/domain/usecases/get_students_usecase.dart';
import 'package:class_room_app/feature/student/domain/usecases/save_student_usecase.dart';
import 'package:class_room_app/feature/student/domain/usecases/delete_student_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';
import 'package:class_room_app/core/data/dao/attendance_dao.dart';
import 'package:class_room_app/feature/attendance/data/datasources/attendance_local_data_source.dart';
import 'package:class_room_app/core/network/network_info.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:class_room_app/feature/attendance/data/repositories/attendance_repository_impl.dart';
import 'package:class_room_app/feature/attendance/domain/repositories/attendance_repository.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/save_attendance_usecase.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/get_attendances_usecase.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/feature/attendance/presentation/state/attendance_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerModule = _$RegisterModule();
  g.registerLazySingleton<StudentDao>(() => StudentDao());
  g.registerLazySingleton<SubjectDao>(() => SubjectDao());
  g.registerLazySingleton<Dio>(() => registerModule.dio);
  g.registerLazySingleton<DataConnectionChecker>(
      () => registerModule.dataConnectionChecker);

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<SubjectLocalDataSource>(
        () => SubjectLocalDataSourceImpl(
              subjectDao: g<SubjectDao>(),
            ));
    g.registerLazySingleton<SubjectRepository>(() => SubjectRepositotryImpl(
          subjectLocalDataSource: g<SubjectLocalDataSource>(),
        ));
    g.registerLazySingleton<GetSubjectsUsecase>(() => GetSubjectsUsecase(
          subjectRepository: g<SubjectRepository>(),
        ));
    g.registerLazySingleton<DeleteSubjectUsecase>(() => DeleteSubjectUsecase(
          subjectRepository: g<SubjectRepository>(),
        ));
    g.registerLazySingleton<SaveSubjectUsecase>(() => SaveSubjectUsecase(
          subjectRepository: g<SubjectRepository>(),
        ));
    g.registerLazySingleton<StudentLocalDataSource>(
        () => StudentLocalDataSourceImpl(
              studentDao: g<StudentDao>(),
            ));
    g.registerLazySingleton<StudentRepository>(() => StudentRepositotryImpl(
          studentLocalDataSource: g<StudentLocalDataSource>(),
        ));
    g.registerLazySingleton<GetStudentsUsecase>(() => GetStudentsUsecase(
          studentRepository: g<StudentRepository>(),
        ));
    g.registerLazySingleton<SaveStudentUsecase>(() => SaveStudentUsecase(
          studentRepository: g<StudentRepository>(),
        ));
    g.registerLazySingleton<DeleteStudentUsecase>(() => DeleteStudentUsecase(
          studentRepository: g<StudentRepository>(),
        ));
    g.registerLazySingleton<UpdateSubjectUsecase>(() => UpdateSubjectUsecase(
          subjectRepository: g<SubjectRepository>(),
        ));
    g.registerLazySingleton<AttendanceDao>(() => AttendanceDao());
    g.registerLazySingleton<AttendanceLocalDataSource>(
        () => AttendanceLocalDataSourceImpl(
              attendanceDao: g<AttendanceDao>(),
            ));
    g.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
          dataConnectionChecker: g<DataConnectionChecker>(),
        ));
    g.registerFactory<SubjectStore>(() => SubjectStore(
          getSubjectsUsecase: g<GetSubjectsUsecase>(),
          saveSubjectUsecase: g<SaveSubjectUsecase>(),
          deleteSubjectUsecase: g<DeleteSubjectUsecase>(),
          updateSubjectUsecase: g<UpdateSubjectUsecase>(),
        ));
    g.registerFactory<StudentStore>(() => StudentStore(
          getStudentsUsecase: g<GetStudentsUsecase>(),
          saveStudentUsecase: g<SaveStudentUsecase>(),
          deleteStudentUsecase: g<DeleteStudentUsecase>(),
        ));
    g.registerLazySingleton<AttendanceRepository>(
        () => AttendanceRepositoryImpl(
              attendanceLocalDataSource: g<AttendanceLocalDataSource>(),
            ));
    g.registerLazySingleton<SaveAttendanceUsecase>(() => SaveAttendanceUsecase(
          attendanceRepository: g<AttendanceRepository>(),
        ));
    g.registerLazySingleton<GetAttendancesUsecase>(() => GetAttendancesUsecase(
          attendanceRepository: g<AttendanceRepository>(),
        ));
    g.registerLazySingleton<UpdateAttendanceUsecase>(
        () => UpdateAttendanceUsecase(
              attendanceRepository: g<AttendanceRepository>(),
            ));
    g.registerFactory<AttendanceStore>(() => AttendanceStore(
          saveAttendanceUsecase: g<SaveAttendanceUsecase>(),
          getAttendancesUsecase: g<GetAttendancesUsecase>(),
          updateAttendanceUsecase: g<UpdateAttendanceUsecase>(),
        ));
  }
}

class _$RegisterModule extends RegisterModule {}
