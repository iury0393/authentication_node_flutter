import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  //Para retornar usuário
  Future getData() async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        //print(response.data);
        var data = response.data;
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  //Para o registro de novo usuário
  Future signUpUser(name, email, password) async {
    try {
      Response response = await Dio().post(url,
          data: {'name': '$name', 'email': '$email', 'password': '$password'});

      if (response.statusCode == 200) {
        //print(response.data);
        var data = response.data;
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  //Para o login do novo usuário
  Future signInUser(email, password) async {
    try {
      Response response = await Dio()
          .post(url, data: {'email': '$email', 'password': '$password'});

      if (response.statusCode == 200) {
        //print(response.data);
        var data = response.data;
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
