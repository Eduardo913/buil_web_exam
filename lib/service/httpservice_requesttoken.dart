import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> servicerequesttoken() async {
  final response = http.post(
    Uri.parse("http://dev.memry.feelycom.com/rmnd/api/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "username": "webclient",
      "password": "Th3Fl1RtRPa55W0rd"
    }),
  );

  return await response.then((value) => value.headers["authorization"]!);
}
