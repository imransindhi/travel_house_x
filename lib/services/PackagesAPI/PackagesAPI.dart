import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_house_x/dataClasses/PackageInfo.dart';
import 'package:travel_house_x/services/PackagesAPI/PackagesAPIInterface.dart';
import 'package:travel_house_x/utils/LogUtils.dart';

class PackagesAPI {
  PackagesAPIInterface _packagesAPIInterface;

  Future<void> getPackageInformation(
      PackagesAPIInterface packagesAPIInterface) async {
    this._packagesAPIInterface = packagesAPIInterface;
    String URL = "http://apidev.travelhouse.world/api/v1/packages";

    var response = await http
        .get(Uri.encodeFull(URL), headers: {"x-api-key": "codex@123"});

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body.toString());
      List<PackageInfo> packagesInfoList = List();
      for (var u in jsonData) {
        packagesInfoList.add(PackageInfo.fromJson(u));
      }
      _packagesAPIInterface.onSuccessPackages(packagesInfoList);
    } else {
      LogUtils.e("Package Get error: ${response.statusCode}");
      _packagesAPIInterface.onFailurePackages("Packages Info Get Failed");
    }
  }
}
