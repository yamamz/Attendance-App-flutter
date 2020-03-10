import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/core/widgets/generic_button.dart';
import 'package:class_room_app/core/widgets/generic_text_form_field.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/presentation/pages/add_student_list.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddSubjectPage extends StatefulWidget {
  AddSubjectPage({Key key, this.subjectEntity, this.index}) : super(key: key);
  final SubjectEntity subjectEntity;
  final int index;

  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  List<StudentEntity> selectedStudents = [];
  TextEditingController _nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final reactiveModel = Injector.getAsReactive<StudentStore>();
    if (widget.subjectEntity != null) {
      _nameController.text = widget.subjectEntity.name;
      reactiveModel.setState(
        (store) => store.addSelectedStudent(widget.subjectEntity.students),
      );
    } else {
      reactiveModel.setState(
        (store) => store.addSelectedStudent([]),
      );
    }
    reactiveModel.setState(
      (store) => store.getStudents(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectEntity != null ? 'Update Subject' : 'Add Subject'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddStudentList(
                    selectedStudents: selectedStudents,
                  );
                }));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: StateBuilder<StudentStore>(
          models: [Injector.getAsReactive<StudentStore>()],
          builder: (context, reactiveModel) {
            return reactiveModel.whenConnectionState(
              onIdle: () => Container(),
              onWaiting: () => Container(),
              onData: (store) {
                selectedStudents = store.studentSelected;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 16,
                          ),
                          GenericTextFormField(
                            editingController: _nameController,
                            label: 'Subject',
                            isRequired: true,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Enrolled Students',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: PRIMARY_COLOR, fontSize: 16),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 300,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: selectedStudents.isNotEmpty
                                ? ListView.builder(
                                    itemCount: selectedStudents.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          child: Text(selectedStudents[index].fullname.substring(0, 1)),
                                        ),
                                        title: Text(selectedStudents[index].fullname),
                                      );
                                    },
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/log.png',
                                          height: 100,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text('No Student added tap the icon above to add')
                                      ],
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              onError: (_) => Container(),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          child: Center(
            child: GenericButton(
              label: (widget.subjectEntity == null) ? 'Save' : 'Update',
              onClick: () async {
                var box = await Hive.openBox<StudentEntity>('students');
                if (_formKey.currentState.validate()) {
                  final reactiveModel = Injector.getAsReactive<SubjectStore>();
                  var subject = SubjectEntity(
                    name: _nameController.text,
                  );
                  subject.students = HiveList(box);
                  subject.students.addAll(selectedStudents);
                  print(widget.index);
                  reactiveModel.setState(
                    (store) => store.saveSubject(subject, widget.index),
                  );
                  Navigator.of(context).pop(true);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
