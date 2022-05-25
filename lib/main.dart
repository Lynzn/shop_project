import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''), fit: BoxFit.cover))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(2), offset: Offset(0, -4), blurRadius: 8)
                      ]),
                  child: Column(
                    children: [
                      Text(
                        'Tas Gigi Hadid',
                        style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
