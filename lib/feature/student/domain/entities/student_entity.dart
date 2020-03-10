import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
part 'student_entity.g.dart';

@HiveType(typeId: 0)
class StudentEntity extends HiveObject {
  @HiveField(0)
  final String fullname;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String mobile;
  @HiveField(3)
  final int age;
  @HiveField(4)
  final String email;

  StudentEntity({
    @required this.fullname,
    @required this.address,
    this.age,
    this.mobile,
    this.email,
  });
}
