import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future<dynamic> getData() async {
  
    http.Response responce;
    
    responce = await http.get(Uri.parse(url));

    if (responce.statusCode == 200){

      String data = responce.body;

      return jsonDecode(data);

    }else{
      // error
      print(responce.statusCode);
      return;
    }


  }
}