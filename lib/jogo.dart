import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!";
  var _resultadoColor = Colors.black;

  int _pontosUsuario = 0;
  int _pontosApp = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
        _resultadoColor = Colors.blue;
        _pontosUsuario++;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
        _resultadoColor = Colors.red;
        _pontosApp++;
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
        _resultadoColor = Colors.yellow;
      });
    }
  }

  void _reiniciarJogo() {
    setState(() {
      _pontosUsuario = 0;
      _pontosApp = 0;
      _resultadoFinal = "Boa sorte!";
      _imagemApp = AssetImage("images/padrao.png");
      _resultadoColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('JokenPO'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Placar: Você $_pontosUsuario x $_pontosApp App",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolham uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: const Image(
                      image: AssetImage('images/pedra.png'),
                      height: 100,
                    ),
                  ),
                  const Text("Pedra", style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: const Image(
                      image: AssetImage('images/papel.png'),
                      height: 100,
                    ),
                  ),
                  const Text("Papel", style: TextStyle(fontSize: 18)),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: const Image(
                      image: AssetImage('images/tesoura.png'),
                      height: 100,
                    ),
                  ),
                  const Text("Tesoura", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _resultadoColor),
            ),
          ),
          ElevatedButton(
            onPressed: _reiniciarJogo,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text("Reiniciar Jogo"),
          ),
        ],
      ),
    );
  }
}
