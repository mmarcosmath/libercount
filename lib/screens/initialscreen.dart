import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:super_qr_reader/super_qr_reader.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String url = "http://192.168.0.105:3000/livros";

  Future<bool> check(String code) async {
    http.Response res;
    try {
      res = await http.get(url + '/codigo/' + code);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        await http.put(url + '/codigo/' + data['_id']);
        print(url + '/codigo/' + data['_id']);
      }
    } catch (e) {
      print(e);
      return false;
    }
    // var data = jsonDecode(res.body);
    print(res.body);
    // print(data);
    return true;
  }

  Future<void> scanner() async {
    String results = await Navigator.push(
      // waiting for the scan results
      context,
      MaterialPageRoute(
        builder: (context) => ScanView(), // open the scan view
      ),
    );
    if (results != null) {
      await check(results);
      scanner();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
            return Stack(
              children: <Widget>[
                Container(
                  width: boxConstraints.maxWidth,
                  height: boxConstraints.maxHeight * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                    gradient: LinearGradient(
                      // begin: Alignment.topRight,
                      transform: GradientRotation(1.5708),
                      colors: [
                        Color.fromRGBO(88, 165, 225, 1),
                        Color.fromRGBO(48, 210, 114, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.7),
                  child: GestureDetector(
                    onTap: () {
                      scanner();

                      final snack = SnackBar(
                        content: Text("Ok!"),
                        duration: Duration(seconds: 2),
                      );

                      Scaffold.of(context).showSnackBar(snack);
                    },
                    child: Container(
                      width: boxConstraints.maxWidth,
                      height: boxConstraints.maxHeight * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                        gradient: LinearGradient(
                          transform: GradientRotation(1.5708),
                          colors: [
                            Color.fromRGBO(48, 210, 114, 1),
                            Color.fromRGBO(88, 165, 225, 1),
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              'images/qr.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            "SCANEAR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, top: 15),
                    child: PopupMenuButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      color: Color.fromRGBO(76, 160, 191, 1),
                      itemBuilder: (context) {
                        var list = List<PopupMenuEntry<Object>>();
                        list.add(
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () async {
                                print("Configura~pes");
                                // await check('5555');
                              },
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    "Configurações",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            value: 1,
                          ),
                        );
                        return list;
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
