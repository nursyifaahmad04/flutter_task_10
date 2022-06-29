import 'package:flutter/material.dart';
import 'package:flutter_tugas_10/screens/pelanggan/index.dart';
import 'package:flutter_tugas_10/screens/barang/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syifa Computer'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => MyHomePage());
                Navigator.push(context, route);
              },
              child: Text('Data Pelanggan'),
            ),
            RaisedButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => PageBarang());
                Navigator.push(context, route);
              },
              child: Text('Data Barang'),
            ),
          ],
        ),
      ),
    );
  }
}
