import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:travel_house_x/dataClasses/packages_information.dart';
class PackagesAPI
{
  Future<List<PackagesInformation>> getPackageInformation() async {
    String URL = "http://apidev.travelhouse.world/api/v1/packages";
    var data = await http.get(Uri.encodeFull(URL), headers: {"X-API-KEY": "CODEX@123"});
    // convert data into JSON object
    var jsonData = json.decode(data.body);
    List<PackagesInformation> package_information = [];
    for (var u in jsonData)
      {
        PackagesInformation packagesInformation = PackagesInformation(u["holidayName"] ,u["packageDescription"], u["holidayAvailableFrom"], u["holidayAvailableTo"], u["holidayTravelDateFrom"], u["holidayTravelDateTo"], u["noOfNights"], u["noOfDays"], u["starRating"], u["packagePrice"], u["primaryImage"]);
        package_information.add(packagesInformation);
      }
}
}