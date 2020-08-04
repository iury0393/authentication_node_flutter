import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        String data = response.data;
        print(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
