// Tela inicial do app: usada navegar nas páginas do app
// Usamos o PageView para podermos utilizar o drawer em todas as telas
// do drawer 

/**
 * Utilizamos a ordem de cada tela para a navegação das páginas.
 * Utilizamos essa ordem no DrawerTile para navegação
 * 0 - HomeTab()
 * 1 -
 * 2 -
 * 3 -
 */

import 'package:flutter/material.dart';
import 'package:loja_online/tabs/home_tab.dart';
import 'package:loja_online/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;

  final _pageController = PageController();

  HomeScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController, // controlador do PageView
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          // Passamos o PageController PageView para o CustomDrawer para podermos
          // ter acesso ao controle da navegação das páginas
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}