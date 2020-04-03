import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_house_x/utils/LogUtils.dart';

class UserInformationAPI {
  Future<void> getUserInformation() async {
    String URL = "http://apidev.travelhouse.world/api/v1/user/view";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(Uri.encodeFull(URL),
        headers: {"Authorization": sharedPreferences.getString('token')});
    var status = json.decode(response.body.toString());
    sharedPreferences.setString("user_id", status['user_id']);
    LogUtils.d(status['other' '']);
  }
}
