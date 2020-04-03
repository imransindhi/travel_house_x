import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_house_x/dataClasses/packages_information.dart';
class PackagesAPI
{
  Future<List<PackagesInformation>> getPackageInformation() async {
    String URL = "http://apidev.travelhouse.world/api/v1/packages";


    var response = await http.get(Uri.encodeFull(URL), headers: {"x-api-key": "codex@123"});
//    // convert data into JSON object
    var jsonData = json.decode(response.body.toString());
    List<PackagesInformation> package_information = [];
    for (var u in jsonData)
      {
        PackagesInformation packagesInformation = PackagesInformation(u["holiday_name"] ,u["package_description"], u["holiday_available_from"], u["holiday_available_to"], u["holiday_travel_date_from"], u["holiday_travel_date_to"], u["no_of_nights"], u["no_of_days"], u["star_rating"], u["package_price"], u["primary_image"]);
        package_information.add(packagesInformation);
      }
    return package_information;
}
}