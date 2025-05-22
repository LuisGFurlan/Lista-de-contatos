import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_de_contatos/globals.dart';
import 'package:lista_de_contatos/models/contatos_model.dart';
import 'package:lista_de_contatos/screens/criar_contatos_page.dart';
import 'package:lista_de_contatos/screens/home_page.dart';
import 'package:lista_de_contatos/widgets/container_custom.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  bool viewAnotacao = false;
  @override
  void initState() {
    super.initState();
  }

  

  void deleteContato(index) {
    listaContatos.removeAt(index);
    QuickAlert.show(
        title: 'Sucesso',
        context: context,
        type: QuickAlertType.success,
        text: 'Contato Excluido!',
        confirmBtnText: 'OK',
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        textColor: Colors.white,
        titleColor: Colors.white,
        confirmBtnColor: Color(0xFF15bf5f),
      ).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContatosPage()),
        );
      });
    ;
  }

  void editContato(Contatos contato, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CriarContatosPage(contato: contato, index: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30), //cor de fundo da tela
      appBar: AppBar(
        title: Text(
          "Contatos",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lexend',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ), //título centralizado
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ], //ícone no canto direito
        centerTitle: true, //centraliza o título
        backgroundColor: Color.fromARGB(255, 42, 42, 42), //cor do appBar
        automaticallyImplyLeading: false, //remove a seta de voltar (arrowback)
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0), //espaçamento geral da lista
          child: ListView.separated(
            separatorBuilder:
                (context, index) =>
                    SizedBox(height: 15), //espaço entre os cards
            itemCount: listaContatos.length, //quantidade de itens na lista
            itemBuilder: (context, index) {
              final contato = listaContatos[index]; //pega o contato da vez
              return Column(
                children: [
                  ExpansionTile(
                    backgroundColor: Color.fromARGB(
                      255,
                      42,
                      42,
                      42,
                    ), //cor quando aberto
                    collapsedBackgroundColor: Color.fromARGB(
                      255,
                      42,
                      42,
                      42,
                    ), //cor quando fechado
                    iconColor: Colors.white, //cor do ícone aberto
                    collapsedIconColor: Colors.white, //cor do ícone fechado
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ), //bordas quando fechado
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ), //bordas quando aberto
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          child: Text(
                            contato.nomeContato[0],
                            style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ), //pega a primeira letra do nome
                          backgroundColor: contato.cor, //cor aleatória no avatar
                          foregroundColor: Colors.white, //cor da letra
                        ),
                        SizedBox(width: 10), //espaço entre avatar e nome
                        Text(
                          contato.nomeContato, //exibe o nome do contato
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0), //espaço interno
                              child: ContainerCustom(
                                texto: "Celular", //título do campo
                                texto2: contato.celularContato, //valor do campo
                              ),
                            ),
                          ),
                          Expanded(
                            child: Visibility(
                              visible: contato.telefoneContato!.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0), //espaço interno
                                child: ContainerCustom(
                                  texto: "Telefone", //título do campo
                                  texto2:
                                      contato.telefoneContato ?? ""//valor do campo (verifica se é nulo)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      Visibility(
                        visible :contato.anotaContato!.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0), //espaço do campo
                          child: ContainerCustom(
                            texto: "Anotações", //título do campo
                            texto2:
                                contato.anotaContato ??
                                "", //valor do campo (verifica se é nulo)
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  deleteContato(index);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Color(0xFFA62424),
                                  size: 28,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(100, 60),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFFE03535),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  editContato(contato, index);
                                },
                                child: Icon(
                                  Icons.edit_square,
                                  color: Color(0xFF7D7300),
                                  size: 25,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(150, 60),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFFE4E446),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.call,
                                  color: Color(0xFF38A244),
                                  size: 28,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(150, 60),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    Color(0xFF46E451),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  (listaContatos.length-1) == index ?
                  SizedBox(height: 85,) : SizedBox()
                ],
              );
            },
          ),
          
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, //posição inferior direita
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CriarContatosPage(),
              ), //navega para a página de criar contatos
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ), //ícone do botão
          backgroundColor: Color(0xFF925CFF), //cor de fundo do botão
          shape: CircleBorder(), //deixa o botão redondo
        ),
      ),
    );
  }
}
