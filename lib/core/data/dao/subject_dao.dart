import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubjectDao {
  String boxName = 'subject';

  Future<SubjectEntity> insert(SubjectEntity subjectEntity) async {
    print('trigger');
    var box = await Hive.openBox<SubjectEntity>(boxName);
    final int key = await box.add(subjectEntity);
    return box.get(key);
  }

  Future<SubjectEntity> update(SubjectEntity subjectEntity, int index) async {
    var box = await Hive.openBox<SubjectEntity>(boxName);
    var subject = box.getAt(index);
    await box.put(subject.key, subjectEntity);
    return box.getAt(index);
  }

  Future<bool> delete(int id) async {
    var box = await Hive.openBox<SubjectEntity>(boxName);
    await box.deleteAt(id);
    return true;
  }

  Future<List<SubjectEntity>> getAllSortedByName() async {
    await Hive.openBox<StudentEntity>('students');
    var box = await Hive.openBox<SubjectEntity>(boxName);
    return box.values.toList();
  }
}
