// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/data/dao/attendance_dao.dart';
import 'feature/attendance/data/datasources/attendance_local_data_source.dart';
import 'feature/attendance/domain/repositories/attendance_repository.dart';
import 'feature/attendance/data/repositories/attendance_repository_impl.dart';
import 'feature/attendance/presentation/state/attendance_store.dart';
import 'feature/student/domain/usecases/delete_student_usecase.dart';
import 'feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'feature/attendance/domain/usecases/get_attendances_usecase.dart';
import 'feature/student/domain/usecases/get_students_usecase.dart';
import 'feature/subject/domain/usecases/get_subjects_usecase.dart';
import 'core/network/network_info.dart';
import 'core/module.dart';
import 'feature/attendance/domain/usecases/save_attendance_usecase.dart';
import 'feature/student/domain/usecases/save_student_usecase.dart';
import 'feature/subject/domain/usecases/save_subject_usecase.dart';
import 'core/data/dao/student_dao.dart';
import 'feature/student/data/datasource/student_local_data_source.dart';
import 'feature/student/domain/repository/student_repository.dart';
import 'feature/student/data/repository/student_repository_impl.dart';
import 'feature/student/presentation/state/student_store.dart';
import 'core/data/dao/subject_dao.dart';
import 'feature/subject/data/datasource/subject_local_datasource.dart';
import 'feature/subject/domain/repository/subject_repository.dart';
import 'feature/subject/data/repository/subject_repository_impl.dart';
import 'feature/subject/presentation/state/subject_store.dart';
import 'feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'feature/subject/domain/usecases/update_subject_usecase.dart';

/// Environment names
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<AttendanceDao>(() => AttendanceDao(), registerFor: {_prod});
  gh.lazySingleton<AttendanceLocalDataSource>(
      () => AttendanceLocalDataSourceImpl(attendanceDao: get<AttendanceDao>()),
      registerFor: {_prod});
  gh.lazySingleton<AttendanceRepository>(
      () => AttendanceRepositoryImpl(
          attendanceLocalDataSource: get<AttendanceLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<DataConnectionChecker>(
      () => registerModule.dataConnectionChecker,
      registerFor: {_prod});
  gh.lazySingleton<DialogService>(() => registerModule.dialogService,
      registerFor: {_prod});
  gh.lazySingleton<Dio>(() => registerModule.dio, registerFor: {_prod});
  gh.lazySingleton<GetAttendancesUsecase>(
      () => GetAttendancesUsecase(
          attendanceRepository: get<AttendanceRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<NavigationService>(() => registerModule.navigationService,
      registerFor: {_prod});
  gh.lazySingleton<NetworkInfo>(
      () =>
          NetworkInfoImpl(dataConnectionChecker: get<DataConnectionChecker>()),
      registerFor: {_prod});
  gh.lazySingleton<SaveAttendanceUsecase>(
      () => SaveAttendanceUsecase(
          attendanceRepository: get<AttendanceRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<SnackbarService>(() => registerModule.snackBarService,
      registerFor: {_prod});
  gh.lazySingleton<StudentDao>(() => StudentDao());
  gh.lazySingleton<StudentLocalDataSource>(
      () => StudentLocalDataSourceImpl(studentDao: get<StudentDao>()),
      registerFor: {_prod});
  gh.lazySingleton<StudentRepository>(
      () => StudentRepositotryImpl(
          studentLocalDataSource: get<StudentLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<SubjectDao>(() => SubjectDao());
  gh.lazySingleton<SubjectLocalDataSource>(
      () => SubjectLocalDataSourceImpl(subjectDao: get<SubjectDao>()),
      registerFor: {_prod});
  gh.lazySingleton<SubjectRepository>(
      () => SubjectRepositotryImpl(
          subjectLocalDataSource: get<SubjectLocalDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<UpdateAttendanceUsecase>(
      () => UpdateAttendanceUsecase(
          attendanceRepository: get<AttendanceRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<UpdateSubjectUsecase>(
      () => UpdateSubjectUsecase(subjectRepository: get<SubjectRepository>()),
      registerFor: {_prod});
  gh.factory<AttendanceStore>(
      () => AttendanceStore(
            saveAttendanceUsecase: get<SaveAttendanceUsecase>(),
            getAttendancesUsecase: get<GetAttendancesUsecase>(),
            updateAttendanceUsecase: get<UpdateAttendanceUsecase>(),
          ),
      registerFor: {_prod});
  gh.lazySingleton<DeleteStudentUsecase>(
      () => DeleteStudentUsecase(studentRepository: get<StudentRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<DeleteSubjectUsecase>(
      () => DeleteSubjectUsecase(subjectRepository: get<SubjectRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<GetStudentsUsecase>(
      () => GetStudentsUsecase(studentRepository: get<StudentRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<GetSubjectsUsecase>(
      () => GetSubjectsUsecase(subjectRepository: get<SubjectRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<SaveStudentUsecase>(
      () => SaveStudentUsecase(studentRepository: get<StudentRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<SaveSubjectUsecase>(
      () => SaveSubjectUsecase(subjectRepository: get<SubjectRepository>()),
      registerFor: {_prod});
  gh.factory<StudentStore>(
      () => StudentStore(
            getStudentsUsecase: get<GetStudentsUsecase>(),
            saveStudentUsecase: get<SaveStudentUsecase>(),
            deleteStudentUsecase: get<DeleteStudentUsecase>(),
          ),
      registerFor: {_prod});
  gh.factory<SubjectStore>(
      () => SubjectStore(
            getSubjectsUsecase: get<GetSubjectsUsecase>(),
            saveSubjectUsecase: get<SaveSubjectUsecase>(),
            deleteSubjectUsecase: get<DeleteSubjectUsecase>(),
            updateSubjectUsecase: get<UpdateSubjectUsecase>(),
          ),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends RegisterModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
