// Tela de visualização dos produtos de cada categoria

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_online/datas/product_data.dart';
import 'package:loja_online/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  
  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // quantidade de tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list),)
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          // acessando os itens de cada categoria (selecionada)
          future: Firestore.instance.collection("products").document(snapshot.documentID)
          .collection("items").getDocuments(),
          builder: (context, snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);

            else{
              return TabBarView(
                children: <Widget>[
                  // cria a grade de imagens conforme as imagens vão carregando
                  GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 0.65
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      // transformamos os dados do firebase em um objeto do tipo ProductData
                      ProductData productData = ProductData.fromDocument(snapshot.data.documents[index]);
                      ProductTile("grid", productData);
                    },
                  )
                ],
              );
            }
          },
        )
      ),
    );
  }
}