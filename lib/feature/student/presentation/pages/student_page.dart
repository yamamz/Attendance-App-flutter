import 'package:class_room_app/feature/student/presentation/pages/add_edit_student_page.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:class_room_app/feature/student/presentation/widgets/student_list_item.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:class_room_app/core/constants/color_constant.dart';

class StudentPage extends StatefulWidget {
  StudentPage({Key key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  void initState() {
    super.initState();
    final reactiveModel = Injector.getAsReactive<StudentStore>();
    reactiveModel.setState(
      (store) => store.getStudents(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Student List',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddEditStudentPage(title: 'Add Student');
              },
            ),
          );
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
      return ListView.separated(
        itemCount: store.students.length,
        itemBuilder: (context, index) {
          return StudentListItem(
              studentEntity: store.students[index], index: index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 2);
        },
      );
    } else {
      return _initialState();
    }
  }
}
