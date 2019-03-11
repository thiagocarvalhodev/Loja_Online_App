import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTile(this.icon, this.text, this.pageController, this.page); 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(); // fechamos o Drawer
          pageController.jumpToPage(page); // 'pulamos' para a tela especificada
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(icon, size: 32.0,
              // se o numero da pagina for igual a da atual, irá ser verde, caso contrário, cinza
                color: pageController.page.round() == page ?
                  Theme.of(context).primaryColor :
                  Colors.grey[700]
                ), // icone do DrawerTile
              SizedBox(width: 32.0,), // espaço entre o icon e o texto
              Text(text, 
                style: TextStyle(
                  fontSize: 18.0,
                  // se o numero da pagina for igual a da atual, irá ser verde, caso contrário, cinza
                  color: pageController.page.round() == page ?
                    Theme.of(context).primaryColor :
                    Colors.grey[700]
                ) // Texto do DrawerTile
              ,)
            ],
          ),
        ),
      ),
    ); // retornamos o Material pois queremos os efeitos visuais
  }
}