import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/get_subjects_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/save_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@Injectable(env: ['prod'])
class SubjectStore {
  final GetSubjectsUsecase getSubjectsUsecase;
  final SaveSubjectUsecase saveSubjectUsecase;
  final DeleteSubjectUsecase deleteSubjectUsecase;
  final UpdateSubjectUsecase updateSubjectUsecase;
  SubjectStore({
    @required this.getSubjectsUsecase,
    @required this.saveSubjectUsecase,
    @required this.deleteSubjectUsecase,
    @required this.updateSubjectUsecase,
  });

  List<SubjectEntity> _subjects;
  List<SubjectEntity> get subjects => _subjects;

  void getsubjects() async {
    _subjects = await getSubjectsUsecase(NoParams());
  }

  void saveSubject(SubjectEntity subjectModel, [int index]) async {
    if (index == null) {
      await saveSubjectUsecase(subjectModel);
    } else {
      await updateSubjectUsecase(
          UpdateSubjectParams(index: index, subjectEntity: subjectModel));
    }

    _subjects = await getSubjectsUsecase(NoParams());
  }

  void deleteSubject(int id, int index) async {
    await deleteSubjectUsecase(DeleteSubjectParams(id: index));
    _subjects.removeAt(index);
  }
}
