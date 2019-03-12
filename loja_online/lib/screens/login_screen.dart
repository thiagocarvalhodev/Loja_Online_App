// Tela de Login

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Widget child;

  LoginScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        actions: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Text("CRIAR CONTA", style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}