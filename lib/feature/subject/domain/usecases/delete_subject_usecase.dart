import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/domain/repository/subject_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(env: ['prod'])
class DeleteSubjectUsecase implements Usecase<bool, DeleteSubjectParams> {
  final SubjectRepository subjectRepository;

  DeleteSubjectUsecase({@required this.subjectRepository});
  @override
  Future<bool> call(params) async {
    return await subjectRepository.deleteSubject(params);
  }
}

class DeleteSubjectParams {
  final int id;

  DeleteSubjectParams({this.id});
}
