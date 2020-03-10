import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StudentDao {
  String boxName = 'students';

  Future<StudentEntity> insert(StudentEntity studentEntity) async {
    var box = await Hive.openBox<StudentEntity>(boxName);
    await box.add(studentEntity);
    return studentEntity;
  }

  Future<void> update(StudentEntity studentEntity, int key) async {}

  Future<bool> delete(int id) async {
    var box = await Hive.openBox<StudentEntity>(boxName);
    await box.deleteAt(id);
    return true;
  }

  Future<List<StudentEntity>> getAllSortedByName() async {
    var box = await Hive.openBox<StudentEntity>(boxName);
    return box.values.toList();
  }
}
