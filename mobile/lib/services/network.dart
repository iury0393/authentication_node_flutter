import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        //print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future signInUser(name, email, password) async {
    try {
      Response response = await Dio().post(url,
          data: {'name': '$name', 'email': '$email', 'password': '$password'});

      if (response.statusCode == 200) {
        //print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUpUser() async {
    try {
      Response response = await Dio()
          .post(url, data: {'email': 'jeff@gmail.com', 'password': '123456'});

      if (response.statusCode == 200) {
        //print(response.data);
        return response.data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
