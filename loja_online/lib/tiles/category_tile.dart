// Widget que fará as Tiles da tela de categorias de produtos

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot; // documento com icone e title

  CategoryTile(this.snapshot); // construtor para obter os documentos

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot.data["title"],
        style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.w500,),
      ), // titulo
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        // link da imagem
        backgroundImage: NetworkImage(snapshot.data["icon"]),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}