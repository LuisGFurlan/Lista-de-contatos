import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldCustom extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final Widget? visibility;
  final String texto;
  final int? linhas;
  final int? maxlength;
  final List<TextInputFormatter>? formatTelefone;
  final TextInputType? keyboardType;
  const TextFieldCustom({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.onChanged,
    required this.texto,
    this.visibility,
    this.linhas,
    this.formatTelefone,
    this.maxlength,
    this.keyboardType
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
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
          width:
              MediaQuery.of(context)
                  .size
                  .width, //está definindo que o container tenha a mesma largura da tela
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 42, 42, 42),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              keyboardType: widget.keyboardType,
              maxLength: widget.maxlength,
               buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null, //remove o contador de caracteres
              inputFormatters:
                  widget
                      .formatTelefone, //adiciona o formato padrão de um número brasileiro
              textAlign: TextAlign.left,
              maxLines: widget.linhas ?? 1, //define o máximo de linhas
              minLines: widget.linhas ?? 1, //define o minimio de linhas
              decoration: InputDecoration(
                suffixIcon: widget.visibility,
                border: InputBorder.none, //remove a borda do textfield
              ),
              onChanged: widget.onChanged,
              style: TextStyle(color: Colors.white),
              controller: widget.controller,
              obscureText: widget.obscureText,
            ),
          ),
        ),
      ],
    );
  }
}
