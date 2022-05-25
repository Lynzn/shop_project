import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewHome(),
    );
  }
}

class ListViewHome extends StatelessWidget {
  var date = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Toko Online'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://media2.bulgari.com/f_auto,q_auto/production/dw62a0c52b/images/images/1348757.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 10.0),
              child: Text('Bulgari Dias', style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 50,
              child: Text('Rp 24.500.000', style: TextStyle(color: Colors.orange, fontSize: 30)),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 10.0),
              child: Text('Stok Tersedia = 2 pieces', style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ));
  }
}
