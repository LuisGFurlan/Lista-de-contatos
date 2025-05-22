import 'dart:math';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_de_contatos/globals.dart';
import 'package:lista_de_contatos/models/contatos_model.dart';
import 'package:lista_de_contatos/screens/contatos_page.dart';
import 'package:lista_de_contatos/widgets/text_field_custom.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CriarContatosPage extends StatefulWidget {
  final Contatos? contato;
  final int? index;
  const CriarContatosPage({super.key, this.contato, this.index});

  @override
  State<CriarContatosPage> createState() => _CriarContatosPageState();
}

class _CriarContatosPageState extends State<CriarContatosPage> {
  @override
  void initState() {
    if (widget.contato != null) {
      inputAnotaContatoController.text = widget.contato!.anotaContato ?? "";
      inputCelularContatoController.text = widget.contato!.celularContato;
      inputNomeConatoController.text = widget.contato!.nomeContato;
      inputTelefoneContatoController.text =
          widget.contato!.telefoneContato ?? "";
    }
    // TODO: implement initState
    super.initState();
  }

  final inputNomeConatoController = TextEditingController();
  final inputAnotaContatoController = TextEditingController();
  final inputCelularContatoController = TextEditingController();
  final inputTelefoneContatoController = TextEditingController();

  void SalvarEditContato() {
    setState(() {
      listaContatos[widget.index!] = Contatos(
        nomeContato: inputNomeConatoController.text.trim(),
        anotaContato: inputAnotaContatoController.text.trim(),
        celularContato: inputCelularContatoController.text,
        telefoneContato: inputTelefoneContatoController.text,
        cor: widget.contato!.cor,
      );

      if (inputNomeConatoController.text.trim().isEmpty ||
          inputCelularContatoController.text.isEmpty) {
        //isEmpty verifica se o controller está vazio
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Erro',
          titleColor: Colors.white,
          text: 'Nome e Celular são obrigatórios!',
          textColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          confirmBtnText: 'OK',
          confirmBtnColor: Color(0xFFdd90452),
        );
        return;
      } else {
        if (inputCelularContatoController.text.length <= 14) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Erro',
            titleColor: Colors.white,
            text: 'Digite o número completo!',
            textColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            confirmBtnText: 'OK',
            confirmBtnColor: Color(0xFFdd90452),
          );
          return;
        } else {
          QuickAlert.show(
            title: 'Sucesso',
            context: context,
            type: QuickAlertType.success,
            text: 'Contato Atualizado!',
            confirmBtnText: 'OK',
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            textColor: Colors.white,
            titleColor: Colors.white,
            confirmBtnColor: Color(0xFF15bf5f),
          ).then((_) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ContatosPage()),
              (Route<dynamic> route) => false,
            );
          });
        }
      }
    });
  }

  void salvarContatoButton() {
    setState(() {
      final cores = [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.orange,
        Colors.teal,
      ];
      final random = Random();
      final corAleatoria = cores[random.nextInt(cores.length)];
      Contatos contato = Contatos(
        nomeContato: inputNomeConatoController.text.trim(),
        anotaContato: inputAnotaContatoController.text.trim(),
        celularContato: inputCelularContatoController.text,
        telefoneContato: inputTelefoneContatoController.text,
        cor: corAleatoria,
      );

      if (inputNomeConatoController.text.trim().isEmpty ||
          inputCelularContatoController.text.isEmpty) {
        //isEmpty verifica se o controller está vazio
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Erro',
          titleColor: Colors.white,
          text: 'Nome e Celular são obrigatórios!',
          textColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 30, 30, 30),
          confirmBtnText: 'OK',
          confirmBtnColor: Color(0xFFdd90452),
        );
        return;
      } else {
        if (inputCelularContatoController.text.length < 15) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Erro',
            titleColor: Colors.white,
            text: 'Digite o número do celular completamente!',
            textColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 30, 30, 30),
            confirmBtnText: 'OK',
            confirmBtnColor: Color(0xFFdd90452),
          );
          return;
        } else {
          if (inputTelefoneContatoController.text.isNotEmpty &&
              inputTelefoneContatoController.text.length < 14) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Erro',
              titleColor: Colors.white,
              text: 'Digite o número do telefone completamente!',
              textColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 30, 30, 30),
              confirmBtnText: 'OK',
              confirmBtnColor: Color(0xFFdd90452),
            );
            return;
          } else {
            listaContatos.add(contato);
            QuickAlert.show(
              title: 'Sucesso',
              context: context,
              type: QuickAlertType.success,
              text: 'Contato Adicionado!',
              confirmBtnText: 'OK',
              backgroundColor: Color.fromARGB(255, 30, 30, 30),
              textColor: Colors.white,
              titleColor: Colors.white,
              confirmBtnColor: Color(0xFF15bf5f),
            ).then((_) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ContatosPage()),
                (Route<dynamic> route) => false,
              );
            });
          }
        }
      }

      inputNomeConatoController.clear();
      inputAnotaContatoController.clear();
      inputCelularContatoController.clear();
      inputTelefoneContatoController.clear();
    });
  }

  void cancelarContatoButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ContatosPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 32),
        centerTitle: true,
        title: Text(
          "Adicionar Contato",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lexend',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 42, 42, 42),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextFieldCustom(
                    texto: "Nome",
                    onChanged: (String value) {},
                    obscureText: false,
                    controller: inputNomeConatoController,
                    maxlength: 120,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFieldCustom(
                              keyboardType: TextInputType.phone,
                              formatTelefone: [
                                //adiciona o formato padrão de um número brasileiro
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              texto: "Celular",
                              onChanged: (String value) {},
                              obscureText: false,
                              controller: inputCelularContatoController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            TextFieldCustom(
                              keyboardType: TextInputType.phone,
                              formatTelefone: [
                                //adiciona o formato padrão de um número brasileiro
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              texto: "Telefone",
                              onChanged: (String value) {},
                              obscureText: false,
                              controller: inputTelefoneContatoController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextFieldCustom(
                    linhas: 3,
                    obscureText: false,
                    controller: inputAnotaContatoController,
                    onChanged: (String value) {},
                    texto: "Anotações",
                    maxlength: 200,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: cancelarContatoButton,
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ), //deixa transparente
                        elevation: MaterialStateProperty.all(
                          0,
                        ), //remove a sombra
                        minimumSize: WidgetStateProperty.all(
                          Size(150, 52),
                        ), //width (largura) é o primeiro parametro e o heigth (altura) é o segundo
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.index != null) {
                          SalvarEditContato();
                        } else {
                          salvarContatoButton();
                        }
                      },
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Color(0xFF925CFF),
                        ), //Dentro do botão o WidgetStateProperty é necessário pra mudar a cor
                        minimumSize: WidgetStateProperty.all(
                          Size(150, 52),
                        ), //width (largura) é o primeiro parametro e o heigth (altura) é o segundo
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
