import 'package:flutter/material.dart';
import 'package:loja_online/datas/product_data.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData productData;

  ProductTile(this.type, this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        : Container(),
      ),
    );
  }
}