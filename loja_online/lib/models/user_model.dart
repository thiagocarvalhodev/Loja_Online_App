/*
  Classe que lida com lógica de negócios dos dados do usuário
*/
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends Model {
  // o FirebaseAuth é um singleton, ou seja, so temos 1 instância dele
  // usamos isso como notação
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser; // usuário do firebase

  Map<String, dynamic> userData = Map(); // mapa que armazena os dados do usuário
 
  // Informa que algo está sendo carregado
  void StartLoading (bool isLoading) {
    isLoading = true;
    notifyListeners();
  }
  // torna o isLoading false
  void StopLoading (bool isLoading) {
    isLoading = false;
    notifyListeners();
  }

  bool isLoading = false; // variável que indica se o app está carregando

  // função que fará o Login no app
  singIn() async{
    
  }

  // função que fará o cadastro no app
  // onSucess é responsável pela ação caso o cadastro funcione
  // onFail é responsável pela ação caso o cadastro falhe
  singUp({@required Map<String, dynamic> userData, @required String pass, 
    @required VoidCallback onSucess, @required VoidCallback onFail}) {

    StartLoading(isLoading); // informamos que está carregando
      // criar usuário do firebase com email e senha
      _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass,
        // passamos o firebase user
      ).then((user) async{ // se cadastrou com sucesso
        firebaseUser = user; // salvamos o usuário do firebase

        _saveUserData(userData); // salvamos os dados do usuario no firebase
        
        onSucess(); 
        StopLoading(isLoading); // para de carregar
      }).catchError((e){ // se o cadastro falhou
        onFail();
        StopLoading(isLoading);
      });
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    // salvamos os dados do usuário na nossa clase
    this.userData = userData;
    // salvamos os dados do usuário
    // Os dados do firebase são armazenados em mapa, por isso passamos
    // o userData para salvarmos os dados
    await Firestore.instance.collection("users").document(firebaseUser.uid)
      .setData(userData);
  }

}