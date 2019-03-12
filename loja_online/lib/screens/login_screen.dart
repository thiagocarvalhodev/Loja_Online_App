// Tela de Login

import 'package:flutter/material.dart';
import 'package:loja_online/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final Widget child;

  // Key para acessarmos a validação do Form
  final _formKey =GlobalKey<FormState>();

  LoginScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              // usamos o pushReplacement 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
            child: Text("CRIAR CONTA", style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      ),
      // como iremos usar formulários, colocamos dentro do Form
      body: Form(
        key: _formKey, // key do form
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            // campo de e-mail
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
              ),
              validator: (text){
                // caso seja validado, não precisamos retornar
                // nada
                if(text.isEmpty || !text.contains("@"))
                  return "E-mail inválido";
              }, // função de validação
            ),
            // campo de senha
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              validator: (text){
                if(text.length < 6) 
                  return "Senha inválida";
              }, // função de validação
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.zero,
                child: Text("Esqueci minha senha", style: 
                  TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text("Entrar", style: TextStyle(
                  color: Colors.white
                ),),
                onPressed: (){
                  if(_formKey.currentState.validate()){

                  }
                },
              ),
            )
          ],
        ),
      )
    );
  }
}