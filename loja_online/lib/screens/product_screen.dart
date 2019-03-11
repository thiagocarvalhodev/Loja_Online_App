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

    String size; // variavel para comparar com o tamanho atual

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
              indicatorBgPadding: 5.0,
              autoplay: false,
            )
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // texto título produto
                Text(productData.title, style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold
                  ),
                ),
                // texto preço produto
                Text("R\$ ${productData.price.toStringAsFixed(2)}", style:
                  TextStyle(fontSize: 22.0, color: primaryColor, fontWeight: FontWeight.bold)
                ,),
                SizedBox(height: 16.0,),
                Text("Tamanho"),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0, // espaçamento entre os widgets
                      childAspectRatio: 0.5 // define o tamanho dos icones (proporção)
                    ),
                    scrollDirection: Axis.horizontal,
                    children: productData.sizes.map(
                      (sizes){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              size = sizes;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                // se o tamanho atual é igual ao selecionado, a cor será
                                // a primária, caso contrário, cinza
                                color: size == sizes ? primaryColor : Colors.grey[500],
                                width: 3.0
                              ),
                            ),
                            width: 50.0,
                            alignment: Alignment.center,
                            child: Text(sizes),
                          ),
                        );
                      }
                    ).toList(),
                  ),
                ),
                SizedBox(height: 16.0,),
                // botao
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    color: primaryColor,
                    child: Text("Entre para comprar", textAlign: TextAlign.center,
                      style: 
                        TextStyle(
                          fontSize: 18.0, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white),
                        ),
                    onPressed: (){},
                  ),
                ),
                SizedBox(height: 16.0,),
                Text("Descrição", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                Text(productData.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}

