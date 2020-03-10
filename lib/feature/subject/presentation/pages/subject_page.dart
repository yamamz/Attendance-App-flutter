import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/feature/subject/presentation/pages/add_subject_page.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:class_room_app/feature/subject/presentation/widgets/subject_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SubjectPage extends StatefulWidget {
  SubjectPage({Key key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final reactiveModel = Injector.getAsReactive<SubjectStore>();
    reactiveModel.setState(
      (store) => store.getsubjects(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Subject List',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddSubjectPage();
              },
            ),
          );
        },
      ),
      body: StateBuilder<SubjectStore>(
          models: [Injector.getAsReactive<SubjectStore>()],
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

  Widget hasDataState(SubjectStore store) {
    if (store.subjects != null && store.subjects.isNotEmpty) {
      return ListView.builder(
        itemCount: store.subjects.length,
        itemBuilder: (context, index) {
          print(store.subjects[index].key);
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.white,
                icon: Icons.edit,
                foregroundColor: PRIMARY_COLOR,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddSubjectPage(
                      subjectEntity: store.subjects[index],
                      index: index,
                    );
                  }));
                },
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.white,
                icon: Icons.delete,
                foregroundColor: PRIMARY_COLOR,
                onTap: () {
                  final reactiveModel = Injector.getAsReactive<SubjectStore>();
                  reactiveModel.setState(
                    (store) => store.deleteSubject(index, index),
                  );
                },
              ),
            ],
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddSubjectPage(
                    subjectEntity: store.subjects[index],
                    index: index,
                  );
                }));
              },
              leading: GFAvatar(
                radius: 20,
                child: Image.asset('assets/images/edit.png'),
              ),
              title: Text(store.subjects[index].name),
              trailing: Icon(Icons.arrow_right),
            ),
          );
        },
      );
    } else {
      return _initialState();
    }
  }
}
