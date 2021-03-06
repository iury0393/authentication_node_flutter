import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'network.dart';

var apiUrl = DotEnv().env['BACKEND_URL'];

class AuthModel {
  //Função que retorna todos usuários
  Future<dynamic> getAllUsers() async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/users');

    var usersData = await networkHelper.getData();

    return usersData;
  }

  //Função que retorna 1 usuário
  Future<dynamic> getOneUsers() async {
    NetworkHelper networkHelper =
        NetworkHelper('$apiUrl/users/iury0393@gmail.com');

    var userData = await networkHelper.getData();

    return userData;
  }

  //Função que registra usuário
  Future<dynamic> signUpUser(name, email, password) async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/users');

    var userData = await networkHelper.signUpUser(name, email, password);

    return userData;
  }

  //Função que loga o usuário
  Future<dynamic> signInUser(email, password) async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/sessions');

    var userData = await networkHelper.signInUser(email, password);

    return userData;
  }
}
