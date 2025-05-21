import 'package:flutter/material.dart';

class Contatos{
  final  String nomeContato; 
  final  String? anotaContato; 
  final  String celularContato; 
  final  String? telefoneContato;

  Contatos({
    required this.nomeContato,
    this.anotaContato,
    required this.celularContato,
    this.telefoneContato,
  });
}
