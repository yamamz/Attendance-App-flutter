import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddStudentList extends StatefulWidget {
  AddStudentList({Key key, this.selectedStudents}) : super(key: key);
  final List<StudentEntity> selectedStudents;

  @override
  _AddStudentListState createState() => _AddStudentListState();
}

class _AddStudentListState extends State<AddStudentList> {
  List<StudentEntity> students = [];
  @override
  void initState() {
    super.initState();
    final reactiveModel = Injector.getAsReactive<StudentStore>();
    reactiveModel.setState(
      (store) => store.getStudents(),
    );
    students = widget.selectedStudents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Student List',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          final reactiveModel = Injector.getAsReactive<StudentStore>();
          reactiveModel.setState(
            (store) => store.addSelectedStudent(students),
          );
          Navigator.pop(context);
        },
      ),
      body: StateBuilder<StudentStore>(
          models: [Injector.getAsReactive<StudentStore>()],
          builder: (context, reactiveModel) {
            return reactiveModel.whenConnectionState(
              onIdle: () => _initialState(),
              onWaiting: () => _loadingState(),
              onData: (store) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: hasDataState(store),
              ),
              onError: (_) => _initialState(),
            );
          }),
    );
  }

  Widget _initialState() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/log.png',
              height: 100,
            ),
            Text('Empty Student List', style: TextStyle(color: PRIMARY_COLOR))
          ],
        ),
      ),
    );
  }

  Widget _loadingState() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget hasDataState(StudentStore store) {
    if (store.students != null && store.students.isNotEmpty) {
      return ListView.builder(
        itemCount: store.students.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              if (students.contains(store.students[index])) {
                students.remove(store.students[index]);
                setState(() {});
                print('remove');
              } else {
                students.add(store.students[index]);
                print('add');
                setState(() {});
              }
            },
            selected: (students.contains(store.students[index])) ? true : false,
            leading: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Container(
                width: 48,
                height: 48,
                padding: EdgeInsets.symmetric(vertical: 4.0),
                alignment: Alignment.center,
                child: CircleAvatar(
                  child: Text(store.students[index].fullname.substring(0, 1)),
                ),
              ),
            ),
            title: Text(store.students[index].fullname),
            subtitle: Text(store.students[index].address),
            trailing: (students.contains(store.students[index]))
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
          );
        },
      );
    } else {
      return _initialState();
    }
  }
}
