import 'package:flutter/material.dart';
import 'package:travel_house_x/services/LoginAPI/LoginAPI.dart';
import 'package:travel_house_x/services/LoginAPI/LoginInterface.dart';
import 'package:travel_house_x/universalWidgets/mySnackBar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginInterface {
  final username = TextEditingController();

  final password = TextEditingController();

  BuildContext _buildContext;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLogginIn = false;

  @override
  Widget build(BuildContext context) {
    LoginAPI api = new LoginAPI(this);

    _buildContext = context;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Hello',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    'There',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      labelText: 'USERNAME',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink))),
                  obscureText: true,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    isLogginIn
                        ? null
                        : api.makeRequest(username.text, password.text);

                    setState(() {
                      isLogginIn = true;
                    });
                  },
                  child: Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.pinkAccent,
                      color: Colors.pinkAccent,
                      elevation: 7.0,
                      child: Center(
                        child: isLogginIn
                            ? Container(
                                width: 15.0,
                                height: 15.0,
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void onFailure(String message) {
    hideLoading();
    mySnackBar(
        _scaffoldKey,
        message ?? "".isEmpty ? "Incorrect Login Credentails" : message,
        Colors.redAccent,
        true);
  }

  @override
  void onSuccessLogin(String message) {
    hideLoading();
    Navigator.of(_buildContext).pushReplacementNamed('/HomeScreen');
  }

  void hideLoading() {
    setState(() {
      isLogginIn = false;
    });
  }
}
