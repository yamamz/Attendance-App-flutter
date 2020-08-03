import 'package:class_room_app/core/constants/style_constants.dart';
import 'package:class_room_app/feature/attendance/presentation/pages/manage_attendance_page.dart';
import 'package:class_room_app/feature/generate_qr/presentation/pages/generate_qr_page.dart';
import 'package:class_room_app/feature/student/presentation/pages/student_page.dart';
import 'package:class_room_app/feature/subject/presentation/pages/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:class_room_app/core/constants/color_constant.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: PRIMARY_COLOR,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/book.png',
                    height: 150,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Welcome',
                    style:
                        TextStyle(color: Colors.white, fontSize: SIZE_VALUE_40),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StudentPage();
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/user.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Manage Student',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PRIMARY_COLOR),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SubjectPage();
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/notebook.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Manage Class',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PRIMARY_COLOR,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ManageAttendancePage();
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/edit.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Manage Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: PRIMARY_COLOR),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GenerateQrPage();
                      }));
                    },
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/laptop.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Student Id Generate Qr',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PRIMARY_COLOR,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
