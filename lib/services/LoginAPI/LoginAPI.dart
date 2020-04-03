import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_house_x/services/LoginAPI/LoginInterface.dart';
import 'package:travel_house_x/utils/LogUtils.dart';

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
    LogUtils.d(username.toString());
    LogUtils.d(password.toString());
    LogUtils.d(token['token'].toString());

//    LogUtils.d("STATUS: ${status['status'].runtimeType}");

    if (status['status'] == true) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('username', username);
      sharedPreferences.setString('password', password);
      sharedPreferences.setString('token', token['token'].toString());
      LogUtils.d(
          'The token is saved as ' + sharedPreferences.getString('username'));
      LogUtils.d(
          'The token is saved as ' + sharedPreferences.getString('password'));
      LogUtils.d(
          'The token is saved as ' + sharedPreferences.getString('token'));
      _loginInterface.onSuccessLogin(token['token']);
    } else {
      LogUtils.e('Invalid username or password');
      _loginInterface.onFailureLogin(token['token']);
    }

//    LogUtils.d(response.body);
//    LogUtils.d(makeURL);
//
//    LogUtils.d(username);
//    LogUtils.d(password);
  }
}
