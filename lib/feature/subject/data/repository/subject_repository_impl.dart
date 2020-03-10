import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/data/datasource/subject_local_datasource.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/repository/subject_repository.dart';
import 'package:class_room_app/feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@RegisterAs(SubjectRepository)
@lazySingleton
@Environment(Env.prod)
class SubjectRepositotryImpl implements SubjectRepository {
  final SubjectLocalDataSource subjectLocalDataSource;
  SubjectRepositotryImpl({@required this.subjectLocalDataSource});
  @override
  Future<List<SubjectEntity>> getSubjects(NoParams params) async {
    final students = await subjectLocalDataSource.getSubjects();
    return students;
  }

  @override
  Future<SubjectEntity> saveSubject(SubjectEntity params) async {
    final result = await subjectLocalDataSource.saveSubject(params);
    return result;
  }

  @override
  Future<bool> deleteSubject(DeleteSubjectParams params) async {
    return await subjectLocalDataSource.deleteSubject(params);
  }

  @override
  Future<SubjectEntity> updateSubject(UpdateSubjectParams params) async {
    return await subjectLocalDataSource.updateSubject(params);
  }
}
