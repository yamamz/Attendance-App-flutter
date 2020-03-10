import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';

abstract class SubjectRepository {
  Future<List<SubjectEntity>> getSubjects(NoParams params);
  Future<SubjectEntity> saveSubject(SubjectEntity params);
  Future<SubjectEntity> updateSubject(UpdateSubjectParams params);
  Future<bool> deleteSubject(DeleteSubjectParams params);
}
