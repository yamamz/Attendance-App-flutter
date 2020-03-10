import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:flutter/material.dart';

class AttendanceLogItem extends StatelessWidget {
  const AttendanceLogItem({Key key, this.attendanceEntity}) : super(key: key);
  final AttendanceEntity attendanceEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(attendanceEntity.subjectEntity.name),
    );
  }
}
