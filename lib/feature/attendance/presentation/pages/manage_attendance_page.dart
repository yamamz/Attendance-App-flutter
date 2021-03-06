import 'dart:io';
import 'dart:typed_data';

import 'package:class_room_app/core/utils/download_path_provider.dart';
import 'package:class_room_app/feature/attendance/presentation/pages/attendance_page.dart';
import 'package:class_room_app/feature/attendance/presentation/state/attendance_store.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:excel/excel.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ManageAttendancePage extends StatefulWidget {
  ManageAttendancePage({Key key}) : super(key: key);

  @override
  _ManageAttendancePageState createState() => _ManageAttendancePageState();
}

class _ManageAttendancePageState extends State<ManageAttendancePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    final reactiveModel = Injector.getAsReactive<SubjectStore>();
    reactiveModel.setState(
      (store) => store.getsubjects(),
    );

    final reactiveModelAttendance = Injector.getAsReactive<AttendanceStore>();
    reactiveModelAttendance.setState(
      (store) => store.getAttendances(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      StateBuilder<SubjectStore>(
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
      StateBuilder<AttendanceStore>(
          models: [Injector.getAsReactive<AttendanceStore>()],
          builder: (context, reactiveModel) {
            return reactiveModel.whenConnectionState(
              onIdle: () => _initialState(),
              onWaiting: () => _loadingState(),
              onData: (store) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: hasDataAttendanceLogState(store),
              ),
              onError: (_) => _initialState(),
            );
          }),
      Container(
        child: Center(
          child: IconButton(
              icon: Icon(Icons.list),
              onPressed: () async {
                Excel excel = Excel.createExcel();
                Sheet sheetObject = excel['Sheet1'];
                List<String> dataList = [
                  "Google",
                  "loves",
                  "Flutter",
                  "and",
                  "Flutter",
                  "loves",
                  "Google"
                ];

                sheetObject.insertRowIterables(dataList, 8);
                Directory downloadsDirectory =
                    await DownloadsPathProvider.downloadsDirectory;
                String appDocPath = downloadsDirectory.path;
                Uint8List excelEncoded = await excel.encode();
                File("$appDocPath/attendance_report.xlsx")
                  ..createSync(recursive: true)
                  ..writeAsBytesSync(excelEncoded);
              }),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Attendance'),
      ),
      body: items.elementAt(_selectedIndex),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.event),
            title: Text('Attendance'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.list),
            title: Text('Logs'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.grid_on),
            title: Text('export to excel'),
          ),
        ],
      ),
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
            Text('Empty List', style: TextStyle(color: PRIMARY_COLOR))
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
      return ListView.separated(
        itemCount: store.subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: GFAvatar(
              radius: 20,
              child: Image.asset('assets/images/edit.png'),
            ),
            title: Text(store.subjects[index].name),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AttendancePage(
                  subjectEntity: store.subjects[index],
                );
              }));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 4);
        },
      );
    } else {
      return _initialState();
    }
  }

  Widget hasDataAttendanceLogState(AttendanceStore store) {
    if (store.attendance != null && store.attendance.isNotEmpty) {
      return ListView.separated(
        itemCount: store.attendance.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: GFAvatar(
              radius: 20,
              child: Image.asset('assets/images/edit.png'),
            ),
            title: Text(store.attendance[index].date),
            subtitle: Text(store.attendance[index].subjectEntity.name),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AttendancePage(
                  attendanceEntity: store.attendance[index],
                );
              }));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 4);
        },
      );
    } else {
      return _initialState();
    }
  }
}
