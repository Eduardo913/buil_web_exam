import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:web_front/provider/service_provider.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ServiceProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const _Center(),
        ),
      ),
    );
  }
}

class _Center extends StatelessWidget {
  const _Center({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              child: Column(
            children: [
              ButtonBar(
                buttonPadding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                alignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      log("libros");
                      provider.libros();
                    },
                    child: const Text("Libros"),
                  ),
                  MaterialButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      provider.musica();
                    },
                    child: const Text("Musica"),
                  ),
                  MaterialButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      provider.peliculas();
                    },
                    child: const Text("Peliculas"),
                  )
                ],
              ),
              TextField(
                controller: provider.globalController,
                maxLines: null,
                decoration:
                    const InputDecoration.collapsed(hintText: "Respuesta"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
