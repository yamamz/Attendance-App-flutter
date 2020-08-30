import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/repository/student_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(env: ['prod'])
class SaveStudentUsecase implements Usecase<StudentEntity, StudentEntity> {
  final StudentRepository studentRepository;

  SaveStudentUsecase({@required this.studentRepository});
  @override
  Future<StudentEntity> call(params) async {
    return await studentRepository.saveStudent(params);
  }
}
