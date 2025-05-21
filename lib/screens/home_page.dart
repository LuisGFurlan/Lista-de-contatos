import 'package:flutter/material.dart';
import 'package:lista_de_contatos/screens/contatos_page.dart';
import 'package:lista_de_contatos/widgets/text_field_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tamSenha = 0;
  String email = 'furlan@gmail.com';
  String senha = '123456';
  bool loguin = true;
  bool tamSenha2 = true;
  bool viewSenha = true;

  final inputEmailController =
      TextEditingController(); //variavel que vai armazenar os valores inseridos do meu input
  final inputSenhaController =
      TextEditingController(); //TextEditingController é o tipo de variavel, permite interagir com o TextField

  void mostrarSenha() {
    //
    setState(() {
      viewSenha = !viewSenha;
    });
  }

  void verificaLoguin(context) {
    if (tamSenha < 6) {
      setState(() {
        tamSenha2 = false;
      });
      return;
    }
    if (email == inputEmailController.text &&
        senha == inputSenhaController.text) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContatosPage()),
        ); // ao nome da classe da nova página
      });
    } else {
      setState(() {
        loguin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldCustom(
              texto: "Email",
              onChanged: (value) {
                setState(() {
                  inputEmailController.text = value;
                  loguin =
                      true; // remove a mensagem de erro ao alterar o e-mail
                });
              },
              obscureText: false,
              controller: inputEmailController,
            ),
            SizedBox(height: 25),
            TextFieldCustom(
              texto: "Senha",
              onChanged: (value) {
                //função para pegar o tamanho da senha digitada
                setState(() {
                  tamSenha = value.length;
                  tamSenha2 = true;
                });
              },
              obscureText: viewSenha,
              controller: inputSenhaController,
              visibility: IconButton(
                onPressed: mostrarSenha,
                icon: Icon(
                  viewSenha
                      ? Icons.visibility
                      : //verificando o estado do botão | praticamente um if
                      Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment:
                    Alignment.centerRight, //Estilizo a posição do meu text
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(height: 10),
            Visibility(
              visible: !tamSenha2,
              child: Text(
                "A senha deve ter no mínimo 6 caracteres",
                style: TextStyle(color: Colors.red),
              ),
            ),
            Visibility(
              visible: !loguin,
              child: Text(
                "Loguin inválido",
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                verificaLoguin(context);
              },
              child: Text(
                "Entrar",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Color(0xFF925CFF),
                ), //Dentro do botão o WidgetStateProperty é necessário pra mudar a cor
                minimumSize: WidgetStateProperty.all(
                  Size(400, 52),
                ), //width (largura) é o primeiro parametro e o heigth (altura) é o segundo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
