import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/repository/student_repository.dart';
import 'package:class_room_app/injection.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
@Environment(Env.prod)
class GetStudentsUsecase implements Usecase<List<StudentEntity>, NoParams> {
  final StudentRepository studentRepository;
  GetStudentsUsecase({@required this.studentRepository});
  @override
  Future<List<StudentEntity>> call(NoParams params) async {
    return await studentRepository.getStudents(params);
  }
}
