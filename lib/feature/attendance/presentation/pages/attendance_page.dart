import 'dart:typed_data';

import 'package:class_room_app/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:class_room_app/feature/attendance/domain/usecases/update_attendance_usecase.dart';
import 'package:class_room_app/feature/attendance/presentation/state/attendance_store.dart';
import 'package:class_room_app/feature/attendance/presentation/widgets/attendance_item.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:flutter/material.dart';
import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key, this.subjectEntity, this.attendanceEntity}) : super(key: key);
  final SubjectEntity subjectEntity;
  final AttendanceEntity attendanceEntity;

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String attyDate = DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal());
  List<Map> attendances = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    if (widget.subjectEntity != null) {
      for (StudentEntity s in widget.subjectEntity.students) {
        attendances.add({'student': s, 'status': 1});
      }
    } else {
      attyDate = widget.attendanceEntity.date;
      attendances = widget.attendanceEntity.attendanceEntries;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(attendances);
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final reactiveModel = Injector.getAsReactive<AttendanceStore>();
          var attendance = AttendanceEntity(
            date: attyDate,
            attendanceEntries: attendances,
            subjectEntity: widget.subjectEntity,
          );
          if (widget.attendanceEntity == null) {
            print('not exist');
            if (reactiveModel.state.attendance
                .where((a) => a.date == attyDate && a.subjectEntity.key == widget.subjectEntity.key)
                .isEmpty) {
              reactiveModel.setState(
                (store) => store.saveAttendance(attendance),
              );
              Navigator.pop(context);
            } else {
              await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      'Confirmation',
                      style: const TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                    content: Text('You have log on this date. Do want to proceed in saving'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('No', style: const TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text('Yes', style: const TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          reactiveModel.setState(
                            (store) => store.saveAttendance(attendance),
                          );
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          } else {
            attendance = AttendanceEntity(
              date: attyDate,
              attendanceEntries: attendances,
              subjectEntity: widget.attendanceEntity.subjectEntity,
            );
            reactiveModel.setState(
              (store) => store.updateAttendance(UpdateAttendanceParams(
                key: widget.attendanceEntity.key,
                attendanceEntity: attendance,
              )),
            );
            Navigator.of(context).pop(true);
          }

          reactiveModel.setState(
            (store) => store.getAttendances(),
          );
        },
        child: Icon(Icons.done_all),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      attyDate = DateFormat('yyyy-MM-dd').format(
                        await showRoundedDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          borderRadius: 16,
                        ),
                      );
                      setState(() {});
                    }),
                IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () async {
                      String cameraScanResult = await scanner.scan();
                      attendances.firstWhere((a) => a['student'].key == int.parse(cameraScanResult)).update('status',
                          (update) {
                        print('ddst' + update.toString());
                        return 0;
                      });
                      setState(() {});
                    })
              ],
              expandedHeight: 220.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text("",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Container(
                  color: PRIMARY_COLOR,
                  height: 220.0,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          '${DateFormat('EEEE').format(DateTime.parse(attyDate))}',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          '${DateFormat('dd').format(DateTime.parse(attyDate))}',
                          style: TextStyle(fontSize: 116, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView.separated(
          itemCount: (widget.subjectEntity != null)
              ? widget.subjectEntity.students.length
              : widget.attendanceEntity.attendanceEntries.length,
          itemBuilder: (context, index) {
            if (widget.attendanceEntity != null) {
              return AttendanceItem(
                studentEntity: widget.attendanceEntity.attendanceEntries[index]['student'],
                index: widget.attendanceEntity.attendanceEntries[index]['status'],
                selectedAttendance: (int selectedIndex) {
                  attendances[index]['status'] = selectedIndex;
                },
              );
            }
            return AttendanceItem(
              studentEntity: widget.subjectEntity.students[index],
              index: attendances[index]['status'],
              selectedAttendance: (int selectedIndex) {
                attendances[index]['status'] = selectedIndex;
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 4);
          },
        ),
      ),
    );
  }
}
