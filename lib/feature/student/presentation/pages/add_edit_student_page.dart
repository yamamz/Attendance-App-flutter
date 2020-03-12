import 'package:class_room_app/core/widgets/document.dart';
import 'package:class_room_app/core/widgets/generic_button.dart';
import 'package:class_room_app/core/constants/color_constant.dart';
import 'package:class_room_app/core/widgets/generic_text_form_field.dart';
import 'package:class_room_app/feature/student/domain/entities/student_entity.dart';
import 'package:class_room_app/feature/student/presentation/state/student_store.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:printing/printing.dart';

class AddEditStudentPage extends StatefulWidget {
  AddEditStudentPage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _AddEditStudentPageState createState() => _AddEditStudentPageState();
}

class _AddEditStudentPageState extends State<AddEditStudentPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  List<String> curreces = ['PHP', 'USD'];
  String selectedCur;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 70,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 80,
                    color: PRIMARY_COLOR,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GenericTextFormField(
                    isRequired: true,
                    editingController: _fullnameController,
                    label: 'Fullname',
                    validator: (String val) {
                      if (val.length <= 0) {
                        return 'this field must be greater than char length';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GenericTextFormField(
                    editingController: _addressController,
                    label: 'Address',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GenericTextFormField(
                          editingController: _ageController,
                          label: 'Age',
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: GenericTextFormField(
                          editingController: _mobileController,
                          label: 'Mobile',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GenericTextFormField(
                    editingController: _emailController,
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Curreces'),
                  Spacer(),
                  SizedBox(
                    child: GenericButton(
                      label: 'Save',
                      onClick: () async {
                        Printing.layoutPdf(
                          onLayout: generateDocument,
                        );
                        if (_formKey.currentState.validate()) {
                          final reactiveModel = Injector.getAsReactive<StudentStore>();
                          reactiveModel.setState(
                            (store) => store.saveStudent(StudentEntity(
                              fullname: _fullnameController.text,
                              address: _addressController.text,
                              mobile: _mobileController.text,
                              age: int.parse((_ageController.text == '') ? '0' : _ageController.text),
                              email: _emailController.text,
                            )),
                            onError: (context, error) {
                              print(error);
                            },
                            onData: (context, store) {},
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
