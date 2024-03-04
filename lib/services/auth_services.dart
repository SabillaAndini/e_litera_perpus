import 'dart:convert';
import 'package:http/http.dart' as http;
import 'globals.dart';

class AuthServices {
  static Future<http.Response> register(
      String username,
      String longname,
      String email,
      // int numberphone,
      String address,
      String password,
      String confirmPassword) async {
    Map data = {
      "username": username,
      "longname": longname,
      "email": email,
      // "nomor": numberphone,
      "address": address,
      "password": password,
      "confirm": confirmPassword,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login-mobile');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
