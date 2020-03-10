import 'package:class_room_app/core/errors/failures.dart';
import 'package:class_room_app/core/usecase/usescase.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/domain/usecases/delete_student_usecase.dart';
import 'package:class_room_app/feature/student/domain/usecases/get_students_usecase.dart';
import 'package:class_room_app/feature/student/domain/usecases/save_student_usecase.dart';
import 'package:class_room_app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@Environment(Env.prod)
class StudentStore {
  final GetStudentsUsecase getStudentsUsecase;
  final SaveStudentUsecase saveStudentUsecase;
  final DeleteStudentUsecase deleteStudentUsecase;
  StudentStore(
      {@required this.getStudentsUsecase, @required this.saveStudentUsecase, @required this.deleteStudentUsecase});

  List<StudentEntity> _students;
  List<StudentEntity> get students => _students;
  List<StudentEntity> _selectedStudents = [];
  List<StudentEntity> get studentSelected => _selectedStudents;

  void getStudents() async {
    _students = await getStudentsUsecase(NoParams());
  }

  void saveStudent(StudentEntity studentModel) async {
    await saveStudentUsecase(studentModel);
    _students = await getStudentsUsecase(NoParams());
  }

  void deleteStudent(int id, int index) async {
    await deleteStudentUsecase(DeleteStudentParams(id: index));
    _students.removeAt(index);
  }

  void addSelectedStudent(List<StudentEntity> selectedStudents) {
    _selectedStudents = selectedStudents;
  }
}
