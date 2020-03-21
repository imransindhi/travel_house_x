import 'package:flutter/material.dart';
import 'package:travel_house_x/services/login_api.dart';

class LoginScreen extends StatelessWidget {

  login_api api = new login_api();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    'There',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.pink)
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller : username,
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)
                    )
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)
                      )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0,),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top : 15.0, left: 20.0),
                  child: InkWell(
                    child: Text('Forgot Password',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.pinkAccent,
                    color: Colors.pinkAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {api.makeRequest(username.text, password.text);},
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
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
}
