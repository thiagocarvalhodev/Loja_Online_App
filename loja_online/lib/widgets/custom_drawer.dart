// Widget que fará o Drawer do app

import 'package:flutter/material.dart';
import 'package:loja_online/tiles/drawer_tile.dart';
import 'package:loja_online/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    // Degradê de fundo
      Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 45, 180, 239),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                height: 170.0,
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text("Loja\nVirtual", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0
                        ),
                      ),
                      top: 8.0, // distância do top
                      left: 0.0, // distância da esquerda
                    ),
                    Positioned(
                      bottom: 8.0,
                      left: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá,", style: 
                            TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold
                            )
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> LoginScreen())
                              );
                            },
                            child: Text("Entre ou cadastre-se >", style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                              ),
                            )
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              // Acesso as paginas da home_screen
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Encontre uma loja", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Meus Pedidos", pageController, 3)   
            ],
          ),
        ],
      )
    );
  }
}