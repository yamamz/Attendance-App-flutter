import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/core/utils/char_to_color.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class StudentListItem extends StatelessWidget {
  const StudentListItem({Key key, @required this.studentEntity, this.index})
      : super(key: key);
  final StudentEntity studentEntity;
  final int index;
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.white,
          icon: Icons.delete,
          foregroundColor: PRIMARY_COLOR,
          onTap: () {
            final reactiveModel = Injector.getAsReactive<StudentStore>();
            reactiveModel.setState(
              (store) => store.deleteStudent(index, index),
            );
          },
        ),
      ],
      child: ListTile(
        onTap: () {},
        subtitle: Text(studentEntity.fullname),
        leading: CircleAvatar(
          backgroundColor:
              getColorByinitial(studentEntity.fullname.substring(1, 2)),
          child: Text(studentEntity.fullname.substring(0, 1)),
        ),
        title: Text('ID:${studentEntity.key.toString()}'),
      ),
    );
  }
}
