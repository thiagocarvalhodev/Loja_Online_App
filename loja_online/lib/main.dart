import 'package:flutter/material.dart';
import 'package:loja_online/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:loja_online/models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // utilizamos o ScopedModel para podermos utilizar os dados do
    // UserModel em todos os locais do app, por isso colocamos
    // 'em cima' do material, pois todos os widgets 'abaixo' irão
    // ter o UserModel
    return ScopedModel<UserModel>(
      model: UserModel(), // model para utilizar os dados no app
      child: MaterialApp(
        title: 'Loja Virtual',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)
        ),
        home: HomeScreen(),
      ),
    );
  }
}