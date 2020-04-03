import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_house_x/services/LoginAPI/LoginInterface.dart';

class LoginAPI {
  LoginInterface _loginInterface;
  LoginAPI(this._loginInterface);

  Future<void> makeRequest(String username, String password) async {
    String makeURL =
        'http://apidev.travelhouse.world/api/v1/user/login?username=$username&password=$password';

    var response = await http
        .post(Uri.encodeFull(makeURL), headers: {"x-api-key": "codex@123"});

    var status = json.decode(response.body.toString());

    var token = status['result'.toString()];
    print(username.toString());
    print(password.toString());
    print(token['token'].toString());

//    print("STATUS: ${status['status'].runtimeType}");

    if (status['status'] == true) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('username', username);
      sharedPreferences.setString('password', password);
      sharedPreferences.setString('token', token['token'].toString());
      print('The token is saved as ' + sharedPreferences.getString('username'));
      print('The token is saved as ' + sharedPreferences.getString('password'));
      print('The token is saved as ' + sharedPreferences.getString('token'));
      _loginInterface.onSuccessLogin(token['token']);
    } else {
      print('Invalid username or password');
      _loginInterface.onFailure(token['token']);
    }

//    print(response.body);
//    print(makeURL);
//
//    print(username);
//    print(password);
  }
}
