import 'network.dart';

const apiUrl = 'http://localhost:3333';

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

  Future<dynamic> signInUser() async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/sessions');

    var userData = await networkHelper.signInUser();

    return userData;
  }
}
