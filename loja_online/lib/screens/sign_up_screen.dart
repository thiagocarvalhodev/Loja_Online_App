import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:loja_online/models/user_model.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey =GlobalKey<FormState>();

  // controladores para obtermos os textos
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

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
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          // se estiver carregando, indicar 
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
            key: _formKey, // key do form
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Nome Completo",
                  ),
                  validator: (text){
                    if(text.isEmpty) return "Nome inválido";
                  },
                ),
                // email
                TextFormField(
                  controller: _emailController,
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
                  controller: _passController,
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
                  controller: _addressController,
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
                        // salvamos um mapa com os dados do usuário
                        Map<String, dynamic> userData = {
                          "name":_nameController.text,
                          "email":_emailController.text,
                          "address":_addressController
                        };
                        // realiza o cadastro
                        model.singUp(
                          userData: userData,
                          pass: _passController.text,
                          onSucess: _onSucess,
                          onFail: _onFail
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }

  // ação ao cadastrar com sucesso
  void _onSucess() {

  }
  // ação ao falhar o cadastro
  void _onFail() {

  }

}