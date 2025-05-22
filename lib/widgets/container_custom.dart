import 'package:flutter/material.dart';

class ContainerCustom extends StatefulWidget {
  final String texto;
  final String texto2;
  const ContainerCustom({super.key, required this.texto, required this.texto2});

  @override
  State<ContainerCustom> createState() => _ContainerCustomState();
}

class _ContainerCustomState extends State<ContainerCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft, //Estilizo a posição do meu text
            child: Text(
              widget.texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 2),
            child: Text(
              widget.texto2,
              style: TextStyle(fontFamily: 'Lexend', color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
