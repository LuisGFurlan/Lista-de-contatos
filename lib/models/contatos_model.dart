import 'package:flutter/material.dart';

class Contatos {
  final String nomeContato;
  final String? anotaContato;
  final String celularContato;
  final String? telefoneContato;
  final Color  cor;

  Contatos({
    required this.nomeContato,
    this.anotaContato,
    required this.celularContato,
    this.telefoneContato,
    required this.cor
  });
}
