// Tela de produto

import 'package:flutter/material.dart';
import 'package:loja_online/datas/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductScreen extends StatefulWidget {
  final ProductData productData; // declaramos o objeto ProductData

  ProductScreen(this.productData); // construtor
  // passamos o objeto para State
  _ProductScreenState createState() => _ProductScreenState(productData);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData productData; // dados do produto selecionado na ProductTiles
  _ProductScreenState(this.productData);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              // temos a lista de urls mas precisamos do NetworkImage
              // usamos o .map para transformar a entrada (sink) da url passada por parametro
              // e retornar na saída (stream) uma NetworkImage usando a url.
              // depoiis transformamos em uma lista de imagens
              images: productData.images.map(
                (url){
                  return NetworkImage(url);
                }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: primaryColor,
              dotBgColor: Colors.purple,
              autoplay: false,
            )
          )
        ],
      ),
    );
  }
}

