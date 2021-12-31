import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<dynamic> getWeatherfromApi(BuildContext context) async {
    final response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=Vehari&units=metric&appid=f8ef20a66ccd2160b871c55961f29c1f"),
      headers: {'Content-type': 'application/json'},
      // body: json.encode({
      //   "email": email,
      // }),
    );
    if (response.statusCode == 200) {
      final requestbody = json.decode(response.body);
      Fluttertoast.showToast(
          msg: "all ok",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          //timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => OTPScreen(
      //               name: name,
      //               email: email,
      //               password: password,
      //               phonenmuber: phonenumber,
      //             )));
      return requestbody;
    } else {
      Fluttertoast.showToast(
          msg: "email is not verified",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          //timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  // Future<bool> ChangePassword(
  //     String Password, String oldpassword, BuildContext context) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         '${Global().baseUrl}/api/services/app/UserProfile/ChangeUserPassword'),
  //     headers: {
  //       'Authorization': 'Bearer ${Global().userToken}',
  //       'content-type': 'application/json',
  //       'accept': 'application/json',
  //     },
  //     body: json.encode({
  //       "currentPassword": oldpassword,
  //       "newPassword": Password,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     Fluttertoast.showToast(
  //         msg: "User changed Successfull",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         //timeInSecForIos: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white);
  //     Navigator.pop(context);
  //   } else {
  //     print(response.body);
  //     Fluttertoast.showToast(
  //         msg: "Password not changed",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         //timeInSecForIos: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white);
  //   }
  // }

}
