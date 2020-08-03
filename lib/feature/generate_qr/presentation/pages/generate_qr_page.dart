import 'dart:io';
import 'dart:typed_data';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:share_extend/share_extend.dart';

import '../../../../core/constants/color_constant.dart';

class GenerateQrPage extends StatefulWidget {
  const GenerateQrPage({Key key}) : super(key: key);

  @override
  _GenerateQrPageState createState() => _GenerateQrPageState();
}

class _GenerateQrPageState extends State<GenerateQrPage> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _inputController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  initState() {
    super.initState();
    this._inputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Qr Code generate'),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(8),
          height: 60,
          child: RaisedButton(
              color: PRIMARY_COLOR,
              onPressed: () => _generateBarCode(this._inputController.text),
              child: Text(
                'Generate qr code',
                style: TextStyle(color: Colors.white),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _qrCodeWidget(this.bytes, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _qrCodeWidget(Uint8List bytes, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 190,
                      child: bytes.isEmpty
                          ? Center(
                              child: Text('Empty code ... ',
                                  style: TextStyle(color: Colors.black38)),
                            )
                          : Image.memory(bytes),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              child: Text(
                                'remove',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () => this
                                  .setState(() => this.bytes = Uint8List(0)),
                            ),
                          ),
                          Text('|',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black26)),
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () async {
                                final success =
                                    await ImageGallerySaver.saveImage(
                                        this.bytes);
                                SnackBar snackBar;
                                if (success != null) {
                                  snackBar = SnackBar(
                                      content: Text(
                                          'Successful Saving please view your gallery!'));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                  this.setState(() {
                                    this.bytes = Uint8List(0);
                                    _inputController.text = '';
                                  });
                                } else {
                                  snackBar =
                                      SnackBar(content: Text('Save failed!'));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text(
                                'save',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Text('|',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black26)),
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              child: Text(
                                'share',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () async {
                                Directory downloadsDirectory =
                                    await DownloadsPathProvider
                                        .downloadsDirectory;
                                String appDocPath = downloadsDirectory.path;
                                Uint8List qrImageBytes = this.bytes;
                                String filePath =
                                    '$appDocPath/qr-${_inputController.text}.png';
                                File(filePath)
                                  ..createSync(recursive: true)
                                  ..writeAsBytesSync(qrImageBytes);

                                ShareExtend.share(filePath, "file");
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 2, color: Colors.black26),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: this._inputController,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.go,
                        onSubmitted: (value) => _generateBarCode(value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.text_fields),
                          helperText:
                              'Please input ID to generage qrcode image.',
                          hintText: 'Please Input Your ID',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _generateBarCode(String inputCode) async {
    Uint8List result = await scanner.generateBarCode(inputCode);
    this.setState(() => this.bytes = result);
  }
}
