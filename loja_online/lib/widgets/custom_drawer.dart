// Widget que fará o Drawer do app

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Widget child;

  CustomDrawer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Degradê de fundo
      Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 45, 180, 239),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(left: 32.0, top: 16.0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Text("Loja\nVirtual", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0
                    ),
                  ),
                  top: 8.0, // distância do top
                  left: 0.0, // distância da esquerda
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}