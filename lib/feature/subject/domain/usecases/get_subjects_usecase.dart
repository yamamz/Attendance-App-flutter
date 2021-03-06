import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/repository/subject_repository.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(env: ['prod'])
class GetSubjectsUsecase implements Usecase<List<SubjectEntity>, NoParams> {
  final SubjectRepository subjectRepository;
  GetSubjectsUsecase({@required this.subjectRepository});
  @override
  Future<List<SubjectEntity>> call(NoParams params) async {
    return await subjectRepository.getSubjects(params);
  }
}
