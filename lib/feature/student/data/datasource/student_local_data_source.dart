import 'package:class_room_app/core/data/dao/student_dao.dart';
import 'package:class_room_app/core/errors/exceptions.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/usecases/delete_student_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';

abstract class StudentLocalDataSource {
  Future<List<StudentEntity>> getStudents();
  Future<StudentEntity> saveStudent(StudentEntity params);
  Future<bool> deleteStudent(DeleteStudentParams params);
}

@LazySingleton(as: StudentLocalDataSource, env: ['prod'])
class StudentLocalDataSourceImpl implements StudentLocalDataSource {
  final StudentDao studentDao;

  StudentLocalDataSourceImpl({this.studentDao});

  @override
  Future<List<StudentEntity>> getStudents() async {
    try {
      return await studentDao.getAllSortedByName();
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }

  @override
  Future<StudentEntity> saveStudent(StudentEntity params) async {
    try {
      print(params);
      final result = await studentDao.insert(params);

      return result;
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }

  @override
  Future<bool> deleteStudent(DeleteStudentParams params) async {
    try {
      return await studentDao.delete(params.id);
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }
}
