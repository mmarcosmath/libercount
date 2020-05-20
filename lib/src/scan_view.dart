import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:libercount/models/database.dart';
import 'package:libercount/models/livro.dart';
import 'package:libercount/src/qrcode_reader_view.dart';
import 'package:vibration/vibration.dart';

class ScanView extends StatefulWidget {
  ScanView({Key key}) : super(key: key);

  @override
  _ScanViewState createState() => new _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  final bd = SimpleDataBase.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }

  List<Livro> lista = [];

  Future onScan(String data) async {
    if (data == null) {
      Navigator.of(context).pop();
    }

    Vibration.vibrate(duration: 200);
    await bd.insert(Livro(codigo: data));
  }
}
