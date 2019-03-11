// Tela de visualização dos produtos de cada categoria

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        body: TabBarView(
          children: <Widget>[
            Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              )
          ],
        ),
      ),
    );
  }
}