import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login_api {

  Future<String> makeRequest(String username, String password) async
  {
    String makeURL = 'http://apidev.travelhouse.world/api/v1/user/login?username=$username&password=$password';

    var response = await http
        .post(Uri.encodeFull(makeURL), headers: {"X-API-KEY": "CODEX@123"});

    var status = json.decode(response.body.toString());

    var token = status['result'.toString()];
    print(username.toString());
    print(password.toString());
    print(token['token'].toString());

//    print("STATUS: ${status['status'].runtimeType}");

    if (status['status'] == true) {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      sharedPreferences.setString('username', username);
      sharedPreferences.setString('password', password);
      sharedPreferences.setString('token', token['token'].toString());
      print('The token is saved as ' + sharedPreferences.getString('username'));
      print('The token is saved as ' + sharedPreferences.getString('password'));
      print('The token is saved as ' + sharedPreferences.getString('token'));
    }
    else
      print('Invalid username or password');

//    print(response.body);
//    print(makeURL);
//
//    print(username);
//    print(password);
  }

}