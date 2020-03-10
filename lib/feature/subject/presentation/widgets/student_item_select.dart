import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:class_room_app/core/constants/color_constant.dart';

class StudentItemSelect extends StatefulWidget {
  const StudentItemSelect({Key key, @required this.studentEntity, this.index, this.tap}) : super(key: key);
  final StudentEntity studentEntity;
  final int index;
  final Function tap;

  @override
  _StudentItemSelectState createState() => _StudentItemSelectState();
}

class _StudentItemSelectState extends State<StudentItemSelect> {
  var isSelected = false;
  var mycolor = Colors.white;
  Widget build(BuildContext context) {
    return Card(
      color: mycolor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints boxConstraints) {
                return Material(
                  color: PRIMARY_COLOR,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
                  child: SizedBox(
                    height: boxConstraints.maxHeight,
                    width: 54,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Text(
                    widget.studentEntity.fullname.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.studentEntity.fullname,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.studentEntity.address,
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
