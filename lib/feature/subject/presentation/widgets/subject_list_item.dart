import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:class_room_app/feature/subject/domain/entities/subject_entity.dart';
import 'package:class_room_app/feature/subject/presentation/pages/add_subject_page.dart';
import 'package:class_room_app/feature/subject/presentation/state/subject_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SubjectListItem extends StatelessWidget {
  final SubjectEntity subjectEntity;
  final int index;
  const SubjectListItem({Key key, this.subjectEntity, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddSubjectPage(
            subjectEntity: subjectEntity,
            index: index,
          );
        }));
      },
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
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
        child: Card(
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
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
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
                          subjectEntity.name.substring(0, 1).toUpperCase(),
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
                            subjectEntity.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
