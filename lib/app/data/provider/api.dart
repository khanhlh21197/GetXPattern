import 'dart:convert';

import 'package:getx_pattern/app/data/model/LoginPostResponse.dart';
import 'package:getx_pattern/app/data/model/album.dart';
import 'package:getx_pattern/app/data/model/menu.dart';
import 'package:getx_pattern/app/data/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';
const cinemaApi = "https://mycinema.asia/service/api/data";
const smartHomeApi = 'http://103.146.23.146:8082/api/';

class MyApiClient {
  final http.Client httpClient;

  MyApiClient({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<MyModel> listMyModel =
            jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('erro');
    } catch (_) {}
  }

  getId(id) async {
    try {
      var response = await httpClient.get('baseUrlid');
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonResponse = json.decode(response.body);
      } else
        print('erro -get');
    } catch (_) {}
  }

  getAlbum() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/2'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print('${jsonDecode(response.body)}');
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  getMenu() async {
    var response = await getData("action=category&type=1");

    return menuFromJson(response);
  }

  String getUrl(String params) {
    String url = cinemaApi + "?channel=app&language=" + "" + "&" + params;
    print("data = " + Uri.encodeFull(url));
    return url;
  }

  Future<String> getData(data) async {
    var response = await http.get(Uri.encodeFull(getUrl(data)),
        // Only accept JSON response
        headers: {"Accept": "application/json"});
    return response.body;
  }

  Future<String> login(
      String phoneNumber, String password, bool isRemember) async {
    var uriResponse = await httpClient.post(
      Uri.parse('http://103.146.23.146:8082/api/Accounts/login'),
      headers: <String, String>{
        'content-type': 'application/json; charset=utf-8'
      },
      body: loginPostResponseToJson(LoginPostResponse(
          phoneNumber: phoneNumber,
          password: password,
          isRemember: isRemember)),
    );

    print(
        '${loginPostResponseToJson(LoginPostResponse(phoneNumber: phoneNumber, password: password, isRemember: isRemember))}');
    print('${uriResponse.body}');

    return uriResponse.body;
  }
}
