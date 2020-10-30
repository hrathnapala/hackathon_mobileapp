library api_service;

import 'dart:async';
import 'dart:convert';

import 'package:hackathon_app/config/url_config.dart' as config;
// import 'package:helath_x_doctor/service/shared_preferences_service.dart'
//     as shared_preferences;
import 'package:hackathon_app/service/shared_preferences_service.dart'
    as shared_preferences;
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<http.Response> fetchGet(String path) async {
  // var token = await shared_preferences.getToken();
  // var language = await shared_preferences.getLanguage();

  // if (token != null && token != "") {
  //   headers['Authorization'] = "Token $token";
  // }
  // headers['Accept-Language'] = "$language";

  final response = await http.get(Uri.encodeFull(path));

  return response;
}

Future<http.Response> fetchPost(String path, Object body) async {
  var encodeBody = json.encode(body);
  var token = await shared_preferences.getToken();
  var language = await shared_preferences.getLanguage();
  if (token != null && token != "") {
    headers['Authorization'] = "Bearer $token";
  }
  headers['Accept-Language'] = "$language";

  print(headers);

  final response = await http.post(Uri.encodeFull(config.apiPath + path),
      body: encodeBody, headers: headers);

  return response;
}

Future<http.Response> fetchPut(String path, Object body) async {
  var language = await shared_preferences.getLanguage();

  var encodeBody = json.encode(body);
  var token = await shared_preferences.getToken();
  if (token != null && token != "") {
    headers['Authorization'] = "Token $token";
  }
  headers['Accept-Language'] = "$language";

  final response = await http.put(Uri.encodeFull(config.apiPath + path),
      body: encodeBody, headers: headers);

  return response;
}

// Future<http.Response> fetchDelete() async {
//   var token = await shared_preferences.getToken();
//   if (token != null && token != "") {
//     headers['Authorization'] = "Token $token";
//   }
//   final response =
//       await http.delete(Uri.encodeFull(config.apiPath), headers: headers);

//   return response;
// }
