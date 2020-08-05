import 'network.dart';

const apiUrl = 'http://localhost:3333';

class AuthModel {
  Future<dynamic> getAllUsers() async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/users');

    var usersData = await networkHelper.getData();

    return usersData;
  }

  Future<dynamic> getOneUsers() async {
    NetworkHelper networkHelper =
        NetworkHelper('$apiUrl/users/iury0393@gmail.com');

    var userData = await networkHelper.getData();

    return userData;
  }

  Future<dynamic> signInUser(name, email, password) async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/users');

    var userData = await networkHelper.signInUser(name, email, password);

    return userData;
  }

  Future<dynamic> signUpUser() async {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/sessions');

    var userData = await networkHelper.signUpUser();

    return userData;
  }
}
