import 'package:flutter/material.dart';
import 'package:loja_online/datas/product_data.dart';
import 'package:loja_online/screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData productData;

  ProductTile(this.type, this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // ao tocar no card, ir para página do produto escolhido,
        // por isso passamos o productData pra tela de produtos
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductScreen(productData))
        );
      },
      child: Card(
        child: type == "grid" ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // usamos o AspectRatio para a imagem não variar de dispositivo para dispositivo
              AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(productData.images[0], fit: BoxFit.cover,),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(productData.title, style: TextStyle( fontWeight: FontWeight.w500
                        ),
                      ),
                      Text("R\$ ${productData.price.toStringAsFixed(2)}", style: 
                        TextStyle(
                          fontSize: 18.0, 
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        : Row(
          children: <Widget>[
            // usamos o Flexible para relativizar o tamanho dos widgets dentro da Row
            Flexible(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(productData.images[0], fit: BoxFit.cover,),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productData.title, style: TextStyle( fontWeight: FontWeight.w500,
                    fontSize: 16.0
                    ),
                  ),
                  Text("R\$ ${productData.price.toStringAsFixed(2)}", style: 
                    TextStyle(
                      fontSize: 18.0, 
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor
                      )
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}