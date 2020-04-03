import 'package:flutter/material.dart';
import 'package:travel_house_x/dataClasses/PackageInfo.dart';
import 'package:travel_house_x/services/PackagesAPI/PackagesAPI.dart';
import 'package:travel_house_x/services/PackagesAPI/PackagesAPIInterface.dart';
import 'package:travel_house_x/services/UserInformationAPI/UserInformationAPI.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements PackagesAPIInterface {
  PackagesAPI packagesAPI = new PackagesAPI();
  List<PackageInfo> packagesInfoList = List();

  UserInformationAPI userInformationAPI = new UserInformationAPI();

  @override
  Widget build(BuildContext context) {
    packagesAPI.getPackageInformation(this);
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text('Travel House'),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  void onFailurePackages(String message) {
    // TODO: Display Package Get Error here
  }

  @override
  void onSuccessPackages(List<PackageInfo> packagesInfoList) {
    this.packagesInfoList = packagesInfoList;
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'EXPLORE', icon: Icons.explore),
  Choice(title: 'FLIGHTS', icon: Icons.flight),
  Choice(title: 'HOTELS', icon: Icons.hotel),
  Choice(title: 'ACTIVITIES', icon: Icons.local_activity),
  Choice(title: 'USER', icon: Icons.person),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
