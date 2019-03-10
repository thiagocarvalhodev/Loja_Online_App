  import 'package:flutter/material.dart';

  class HomeTab extends StatelessWidget {
    final Widget child;
  
    HomeTab({Key key, this.child}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      
      Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 211, 119, 130),
              Color.fromARGB(255, 253, 181, 168)
            ] 
          )
        ),
      );

      return Stack(
        children: <Widget>[
          
        ],
      );
    }
  }