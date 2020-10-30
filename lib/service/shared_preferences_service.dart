library shared_preferences_service;

import 'package:shared_preferences/shared_preferences.dart';

// //// set and get patient barcode
// Future getPatientBarcod() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int lang = prefs.getInt('barcode');
//   return lang;
// }

Future setToken(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', data);
  return;
}

Future setLanguage(String data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('language', data);
  return;
}

Future getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String language = prefs.getString('language');
  return language;
}

Future getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  return token;
}


// Future setAll(
//     String token, String email, String first_name, String last_name) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('token', token);
//   prefs.setString('email', email);
//   prefs.setString('first_name', first_name);
//   prefs.setString('last_name', last_name);
//   return;
// }

// Future getToken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = prefs.getString('token');
//   return token;
// }

// Future setToken(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('token', data);
//   return;
// }

// Future getFirstName() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String first_name = prefs.getString('first_name');
//   return first_name;
// }

// Future setFirstName(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('first_name', data);
//   return;
// }

// Future getLastName() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String last_name = prefs.getString('last_name');
//   return last_name;
// }

// Future setLastName(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('last_name', data);
//   return;
// }

// Future getEmail() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String email = prefs.getString('email');
//   return email;
// }

// Future setEmail(String data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('email', data);
//   return;
// }

Future distroy() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return;
}
