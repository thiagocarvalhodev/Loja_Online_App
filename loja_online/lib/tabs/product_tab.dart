// Tela que mostra as categorias de produtos

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_online/tiles/category_tile.dart';

class ProductTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData) // se não houver dados, usar o indicador de progresso
          return Center(child: CircularProgressIndicator(),);

        else{
          var dividedTiles = ListTile.divideTiles(
            color: Colors.transparent,
            tiles: snapshot.data.documents.map(
              // passamos cada documento para o CategoryTile
              (doc){
                return CategoryTile(doc);
              }
            ).toList()
          ).toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },  
    );
  }
}