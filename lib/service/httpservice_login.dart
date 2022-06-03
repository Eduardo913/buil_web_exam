import 'dart:developer';

import 'package:http/http.dart' as http;

Future<String?> servicelibros() async {
  log("entre al metodo");

  final response = http.get(
    Uri.parse("http://54.197.166.67/api/v1/libros"),
  );

  return await response.then(
    (value) {
      log(value.statusCode.toString());
      return value.body.toString();
    },
  );
}

Future<String?> servicemusica() async {
  final response = http.get(
    Uri.parse("http://35.172.228.214/ceoo/principal"),
  );

  return await response.then(
    (value) {
      log(value.statusCode.toString());
      return value.body.toString();
    },
  );
}

Future<String?> servicepeliculas() async {
  final response = http.get(
    Uri.parse("http://54.172.185.115/api/peliculas"),
  );

  return await response.then(
    (value) {
      log(value.statusCode.toString());
      return value.body.toString();
    },
  );
}
