import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/errors/exceptions.dart';
import 'package:class_room_app/core/network/network_info.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/data/datasource/student_local_data_source.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/repository/student_repository.dart';
import 'package:class_room_app/feature/student/domain/usecases/delete_student_usecase.dart';
import 'package:class_room_app/injection.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@RegisterAs(StudentRepository)
@lazySingleton
@Environment(Env.prod)
class StudentRepositotryImpl implements StudentRepository {
  final StudentLocalDataSource studentLocalDataSource;
  StudentRepositotryImpl({@required this.studentLocalDataSource});
  @override
  Future<List<StudentEntity>> getStudents(NoParams params) async {
    final students = await studentLocalDataSource.getStudents();
    return students;
  }

  @override
  Future<StudentEntity> saveStudent(StudentEntity params) async {
    final result = await studentLocalDataSource.saveStudent(params);
    return result;
  }

  @override
  Future<bool> deleteStudent(DeleteStudentParams params) async {
    return await studentLocalDataSource.deleteStudent(params);
  }
}
