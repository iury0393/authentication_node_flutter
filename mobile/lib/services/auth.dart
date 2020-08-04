import 'network.dart';

const apiUrl = 'http://localhost:3333';

class AuthModel {
  Future<dynamic> getAllUsers() {
    NetworkHelper networkHelper = NetworkHelper('$apiUrl/users');

    var usersData = networkHelper.getData();
    return usersData;
  }
}
