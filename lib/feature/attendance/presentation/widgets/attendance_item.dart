import 'package:class_room_app/core/constants/style_constants.dart';
import 'package:class_room_app/core/utils/char_to_color.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:flutter/material.dart';
import 'package:class_room_app/core/constants/color_constant.dart';

class AttendanceItem extends StatefulWidget {
  AttendanceItem({
    Key key,
    @required this.studentEntity,
    @required this.selectedAttendance,
    this.index,
  }) : super(key: key);
  final StudentEntity studentEntity;
  final Function(int) selectedAttendance;
  final int index;

  @override
  _AttendanceItemState createState() => _AttendanceItemState();
}

class _AttendanceItemState extends State<AttendanceItem> {
  List<bool> attendanceValues = [false, true, false];

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      if (widget.index == 0) {
        attendanceValues = [true, false, false];
      } else if (widget.index == 1) {
        attendanceValues = [false, true, false];
      } else {
        attendanceValues = [false, false, true];
      }
    }
  }

  @override
  void didUpdateWidget(AttendanceItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != null) {
      if (widget.index == 0) {
        attendanceValues = [true, false, false];
      } else if (widget.index == 1) {
        attendanceValues = [false, true, false];
      } else {
        attendanceValues = [false, false, true];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundColor: getColorByinitial(widget.studentEntity.fullname.substring(0, 1)),
              child: Text(widget.studentEntity.fullname.substring(0, 1)),
              radius: SIZE_VALUE_20,
            ),
          ),
          SizedBox(
            width: SIZE_VALUE_16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.studentEntity.fullname),
                SizedBox(height: SIZE_VALUE_8),
                ToggleButtons(
                    constraints: const BoxConstraints(minHeight: SIZE_VALUE_26, minWidth: SIZE_VALUE_90),
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(SIZE_VALUE_8, 0, SIZE_VALUE_8, 0),
                        child: Text('present'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(SIZE_VALUE_8, 0, SIZE_VALUE_8, 0),
                        child: Text('absent'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(SIZE_VALUE_8, 0, SIZE_VALUE_8, 0),
                        child: Text('leave'),
                      ),
                    ],
                    isSelected: attendanceValues,
                    onPressed: (int attIndex) {
                      if (!attendanceValues[attIndex]) {
                        attendanceValues.asMap().forEach((int itemIndex, bool itemValue) {
                          if (itemIndex != attIndex) {
                            attendanceValues[itemIndex] = false;
                          } else {
                            attendanceValues[attIndex] = true;
                          }
                        });
                        setState(() {});
                      }
                      widget.selectedAttendance(attIndex);
                    },
                    borderRadius: BorderRadius.circular(SIZE_VALUE_10),
                    borderWidth: 1,
                    selectedBorderColor: Colors.grey,
                    selectedColor: Colors.white,
                    fillColor: PRIMARY_COLOR),
              ],
            ),
          )
        ],
      ),
    );
  }
}
