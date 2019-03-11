// Classe responsável por armazenar os dados do firebase
// no programa

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  // variaveis para armazenar os dados do firebase
  String title;
  String description;

  String category;
  String id;

  List sizes;
  List images;

  double price;
  
  // função que armazena os dados do firebase no app
  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price =snapshot.data["price"];
    sizes = snapshot.data["sizes"];
    images =snapshot.data["images"];

  }

}