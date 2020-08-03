import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/usecases/delete_student_usecase.dart';

abstract class StudentRepository {
  Future<List<StudentEntity>> getStudents(NoParams params);
  Future<StudentEntity> saveStudent(StudentEntity params);
  Future<bool> deleteStudent(DeleteStudentParams params);
}
