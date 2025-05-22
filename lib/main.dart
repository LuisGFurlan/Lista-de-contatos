import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_de_contatos/screens/contatos_page.dart';
import 'package:lista_de_contatos/screens/criar_contatos_page.dart';
import 'package:lista_de_contatos/screens/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      //obrigatório para a estruturação do App
      debugShowCheckedModeBanner: false,
      home:
          HomePage(), //classe que está sendo estilizada no arquivo home_page.dart
    ),
  );
}
