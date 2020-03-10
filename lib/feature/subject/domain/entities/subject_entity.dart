import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:hive/hive.dart';
part 'subject_entity.g.dart';

@HiveType(typeId: 1)
class SubjectEntity extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  HiveList<StudentEntity> students;
  SubjectEntity({this.name});
}
