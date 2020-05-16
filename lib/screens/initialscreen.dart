import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
                      begin: Alignment.topRight,
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
                      print("clicou");
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
                          begin: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(88, 165, 225, 1),
                            Color.fromRGBO(48, 210, 114, 1),
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
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        size: 50,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("clicou");
                      },
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
