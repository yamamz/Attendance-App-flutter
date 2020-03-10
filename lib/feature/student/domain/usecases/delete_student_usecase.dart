import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/domain/repository/student_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
@Environment(Env.prod)
class DeleteStudentUsecase implements Usecase<bool, DeleteStudentParams> {
  final StudentRepository studentRepository;

  DeleteStudentUsecase({@required this.studentRepository});
  @override
  Future<bool> call(params) async {
    return await studentRepository.deleteStudent(params);
  }
}

class DeleteStudentParams {
  final int id;

  DeleteStudentParams({this.id});
}
