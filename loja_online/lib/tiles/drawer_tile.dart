import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  DrawerTile(this.icon, this.text); 

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(icon, size: 32.0,), // icone do DrawerTile
              SizedBox(width: 32.0,), // espaço entre o icon e o texto
              Text(text, style: TextStyle(fontSize: 16.0) // Texto do DrawerTile
              ,)
            ],
          ),
        ),
      ),
    ); // retornamos o Material pois queremos os efeitos visuais
  }
}