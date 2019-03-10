import 'package:flutter/material.dart';
import 'package:loja_online/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)
      ),
      home: HomeScreen(),
    );
  }
}