import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_front/service/httpservice_login.dart';

class ServiceProvider extends ChangeNotifier {
  final TextEditingController _global = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  get globalController => _global;
  get keyformlogin => _keyForm;

  void libros() async {
    log("libro");
    await servicelibros().then(
      (value) {
        log("llegue value");
        _global.text = value!;
      },
    );
  }

  void peliculas() async {
    await servicepeliculas().then(
      (value) {
        _global.text = value!;
      },
    );
  }

  void musica() async {
    await servicemusica().then(
      (value) {
        _global.text = value!;
      },
    );
  }
}
