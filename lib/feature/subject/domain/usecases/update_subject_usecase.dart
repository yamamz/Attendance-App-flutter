import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/repository/subject_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../injection.dart';

@lazySingleton
@Environment(Env.prod)
class UpdateSubjectUsecase implements Usecase<SubjectEntity, UpdateSubjectParams> {
  final SubjectRepository subjectRepository;

  UpdateSubjectUsecase({@required this.subjectRepository});
  @override
  Future<SubjectEntity> call(params) async {
    return await subjectRepository.updateSubject(params);
  }
}

class UpdateSubjectParams {
  final SubjectEntity subjectEntity;
  final int index;

  UpdateSubjectParams({this.subjectEntity, this.index});
}
