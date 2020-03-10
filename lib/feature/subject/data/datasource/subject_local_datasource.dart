import 'package:class_room_app/core/data/dao/subject_dao.dart';
import 'package:class_room_app/core/errors/exceptions.dart';

import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/domain/usecases/delete_subject_usecase.dart';
import 'package:class_room_app/feature/subject/domain/usecases/update_subject_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';

abstract class SubjectLocalDataSource {
  Future<List<SubjectEntity>> getSubjects();
  Future<SubjectEntity> saveSubject(SubjectEntity params);
  Future<SubjectEntity> updateSubject(UpdateSubjectParams params);
  Future<bool> deleteSubject(DeleteSubjectParams params);
}

@RegisterAs(SubjectLocalDataSource)
@lazySingleton
@Environment(Env.prod)
class SubjectLocalDataSourceImpl implements SubjectLocalDataSource {
  final SubjectDao subjectDao;

  SubjectLocalDataSourceImpl({this.subjectDao});

  @override
  Future<List<SubjectEntity>> getSubjects() async {
    try {
      return await subjectDao.getAllSortedByName();
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }

  @override
  Future<SubjectEntity> saveSubject(SubjectEntity params) async {
    try {
      // print(params);
      final result = await subjectDao.insert(params);
      return result;
    } catch (e) {
      print('error ' + e.toString());
      throw StoreException(message: e.toString());
    }
  }

  @override
  Future<bool> deleteSubject(DeleteSubjectParams params) async {
    try {
      return await subjectDao.delete(params.id);
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }

  @override
  Future<SubjectEntity> updateSubject(UpdateSubjectParams params) async {
    try {
      return await subjectDao.update(params.subjectEntity, params.index);
    } catch (e) {
      throw StoreException(message: e.toString());
    }
  }
}
