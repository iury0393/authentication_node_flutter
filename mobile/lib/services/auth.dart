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
}
