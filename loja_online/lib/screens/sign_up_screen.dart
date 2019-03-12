import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey =GlobalKey<FormState>();

  final Widget child;

  SignUpScreen({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
      ),
      // como iremos usar formulários, colocamos dentro do Form
      body: Form(
        key: _formKey, // key do form
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nome Completo",
              ),
              validator: (text){
                if(text.isEmpty) return "Nome inválido";
              },
            ),
            // email
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

            TextFormField(  // Campo de endereço
              decoration: InputDecoration(
                hintText: "Endereço",
              ),
              validator: (text){
                if(text.isEmpty) 
                  return "Endereço inválido"; 
              },
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text("Criar Conta", style: TextStyle(
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