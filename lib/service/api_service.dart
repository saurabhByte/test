
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService{

  static var client = http.Client();

  /*Future<String> readJson() async {
    final String response =
    await rootBundle.loadString('assets/sample.json');
    //final data = await json.decode(response);
    if (response.isNotEmpty) {
      //dynamic responseJson = utf8.decode(response);
      return jsonDecode(response);
    }


  }*/

  // Future<String> readJson()  {
  //   String response = rootBundle.loadString('asset/ranking_response.json') as String;
  //   return jsonDecode(response);
  //   //return rootBundle.loadString('assets/sample.json');
  // }

  /*static  fetchData() async{
    String url = "ranking_response.json";
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      dynamic responseJson = utf8.decode(response.bodyBytes);
      return jsonDecode(responseJson);
    }

  }*/

  // static Future<Main> fetchData() async{
  //   var response = await client.get(Uri.parse(Url.authUrl));
  //   if(response.statusCode == 200){
  //     var jsonString = response.body;
  //     return mainFromJson(jsonString);
  //   }
  // }

  static handleResponse(response) {
    if (response.statusCode == 403) {

    } else {
      //alertMessage(context, response.body);
    }
  }
}