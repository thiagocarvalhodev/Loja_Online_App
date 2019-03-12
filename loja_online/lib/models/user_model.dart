/*
  Classe que lida com lógica de negócios dos dados do usuário
*/
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class UserModel extends Model {
  
  bool isLoading = false; // variável que indica se o app está carregando

  // função que fará o Login no app
  singIn() async{
    isLoading = true;
    notifyListeners(); // notifica todos os listerners para recarregar a página

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();

  }

}