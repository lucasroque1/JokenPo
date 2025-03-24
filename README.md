Documentação da Resolução dos Exercícios do App JokenPo - PDF 1 e 2

Este documento descreve o processo de desenvolvimento de um aplicativo móvel de JokenPo (Pedra, Papel e Tesoura) utilizando o framework Flutter

1. Introdução:
O objetivo deste projeto é criar um aplicativo móvel que permita ao usuário jogar JokenPo contra o próprio aplicativo. O desenvolvimento será realizado utilizando o Flutter, um framework de desenvolvimento de interface de usuário criado pelo Google. O projeto visa demonstrar os componentes fundamentais para a criação de uma aplicação mobile.

2. Configuração Inicial do Projeto:
O primeiro passo para iniciar o desenvolvimento é a criação de um novo projeto Flutter. Utilizando a plataforma flutlab.io/workspace, um novo projeto chamado JokenPo é criado, selecionando um template contendo o Material 3. Para começar do zero, todo o conteúdo do arquivo main.dart é apagado.

3. Importando o Material Design:
Para utilizar os recursos e funcionalidades do Flutter, é necessário importar pacotes Dart que auxiliam no desenvolvimento. Neste aplicativo, o Material Design será utilizado. O Material Design é um sistema adaptável de diretrizes, componentes e ferramentas que suportam as melhores práticas de design de interface de usuário definidas pelo Google, sendo uma recomendação para desenvolvimento Web e Mobile. A importação é realizada adicionando a seguinte linha no início do arquivo main.dart:

import 'package:flutter/material.dart';

Utilizar um framework como o Flutter acelera o desenvolvimento através do uso de códigos já existentes.

5. Estrutura Básica do Aplicativo:
O ponto de entrada para qualquer aplicativo Dart é a função main(). Dentro desta função, o método runApp() do Flutter é chamado para iniciar o aplicativo e anexar o widget raiz à tela. Para utilizar as funcionalidades do Material Design, o widget MaterialApp() é passado para o runApp(). A propriedade home dentro do MaterialApp() define a rota que é exibida inicialmente quando o aplicativo é aberto.

O código inicial do arquivo main.dart:

import 'package:flutter/material.dart';
import 'package:jokenpo/jogo.dart';

void main() {

  runApp(MaterialApp(
    home: Jogo(),
    
  ));
  
}

5. Criando a Classe:
Visando boas práticas e organização do código, uma nova classe Dart chamada Jogo é criada no arquivo jogo.dart dentro da pasta lib. Para criar uma interface de usuário dinâmica, que pode mudar seu estado durante a execução, um StatefulWidget é utilizado. Ao utilizar a opção de inserir um StatefulWidget, o Flutter automaticamente adiciona a estrutura de classe necessária. A classe Jogo é definida como um

StatefulWidget:

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
}

É recomendado que o nome da classe seja o mesmo nome do arquivo .dart, com a primeira letra em maiúscula.

6. Utilizando:
Dentro do método build() da classe _JogoState, o widget Scaffold é retornado. O Scaffold fornece uma estrutura básica para a tela, abrangendo toda a área disponível e organizando visualmente os elementos da interface do usuário. Ele permite a criação de estruturas base como AppBar (barra superior) e body (corpo da tela).

O esqueleto inicial da classe Jogo com o Scaffold:

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPO'),
      ),
      body: const Column(
        children: <Widget>[
        ],
      ),
    );
  }
}

8. Adicionando a 
Dentro do Scaffold, a propriedade appBar recebe um widget AppBar. É possível definir a cor de fundo (backgroundColor), a cor do texto (foregroundColor) e o título (title) da AppBar. No exemplo, o título é definido como "JokenPO", com fundo azul e texto branco.
appBar: AppBar(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  title: const Text('JokenPO'),
),
9. Estruturando o Corpo com  e 
O corpo do aplicativo (body) é estruturado utilizando o widget Column(), que organiza os elementos verticalmente. Para adicionar espaçamento entre os elementos, o widget Padding() é utilizado, definindo margens ao redor de seus filhos.

10. Organizando Elementos com  e 
Para organizar os widgets dentro da Column, as propriedades child e children são utilizadas. child recebe um único widget, enquanto children recebe uma lista de widgets. Como múltiplos elementos (textos e imagens) serão exibidos, a propriedade children é utilizada dentro da Column.

11. Adicionando Imagens ao Corpo
Para exibir as imagens de "pedra", "papel", "tesoura" e a imagem padrão, uma pasta chamada images é criada dentro da pasta raiz do projeto (jokenpo). As imagens necessárias são adicionadas a esta pasta através da opção "Upload files".
Para que o Flutter reconheça essas imagens, o arquivo pubspec.yaml precisa ser editado. As linhas referentes aos assets precisam ser descomentadas e o caminho correto para a pasta de imagens deve ser especificado. Por exemplo:
assets:
  - images/
Se arquivos específicos fossem necessários, eles seriam listados individualmente abaixo do diretório images/. Após a edição do pubspec.yaml, é necessário realizar um novo build do projeto para a Web (CTRL+B). Este processo de adicionar a pasta e referenciá-la no pubspec.yaml garante que as imagens sejam corretamente "versionadas" e acessíveis pelo aplicativo.
As imagens são exibidas utilizando o widget Image e a propriedade image com AssetImage indicando o caminho da imagem. Por exemplo:
Image(image: AssetImage('images/padrao.png'))
11. Tornando as Imagens Interativas com 
Para detectar o toque do usuário nas imagens de escolha (pedra, papel e tesoura), o widget GestureDetector() é utilizado. Este widget permite reconhecer diversos gestos, como onTap (toque simples), onDoubleTap (dois toques), onLongPress (toque prolongado), entre outros. A função desejada para ser executada quando um gesto é detectado é atribuída ao parâmetro correspondente (por exemplo, onTap).
No código completo da Parte 2, os GestureDetector são utilizados em volta das imagens de pedra, papel e tesoura:
GestureDetector(
  onTap: () => _opcaoSelecionada("pedra"),
  child: const Image(
    image: AssetImage('images/pedra.png'),
    height: 100,
  ),
),
12. Implementando a Lógica de Escolha do Usuário e do Aplicativo
Uma variável privada _imagemApp do tipo AssetImage é criada para controlar a imagem exibida para a escolha do aplicativo. Uma função privada _opcaoSelecionada(String escolhaUsuario) é implementada para lidar com a lógica do jogo. Esta função recebe a escolha do usuário como parâmetro. Dentro desta função:
•
A biblioteca dart:math é importada para gerar números aleatórios.
•
Uma lista de opções (opcoes = ["pedra", "papel", "tesoura"];) é criada.
•
Um número aleatório entre 0 e 2 é gerado para representar a escolha do aplicativo.
•
A escolha do aplicativo (escolhaApp) é determinada com base no número aleatório e na lista de opções.
•
Um switch é utilizado para atualizar a variável _imagemApp com a imagem correspondente à escolha do aplicativo.
•
A escolha do usuário e do aplicativo são exibidas no console para teste.
var _imagemApp = AssetImage("images/padrao.png");

void _opcaoSelecionada(String escolhaUsuario) {
  var opcoes = ["pedra", "papel", "tesoura"];
  var numero = Random().nextInt(3);
  var escolhaApp = opcoes[numero];

  print("Escolha do App: " + escolhaApp);
  print("Escolha do Usuário: " + escolhaUsuario);

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
}

13. Implementando a Lógica do Ganhador e Perdedor:
Uma variável privada _resultadoFinal do tipo String é criada para armazenar o resultado da partida, inicialmente com o valor "Boa sorte!!!". Dentro da função _opcaoSelecionada, após determinar as escolhas, uma lógica de comparação é implementada para verificar quem ganhou a partida ou se houve empate. As condições de vitória para o usuário (pedra contra tesoura, tesoura contra papel, papel contra pedra) e para o aplicativo são verificadas. A variável _resultadoFinal é atualizada com a mensagem correspondente ("Parabéns!!! Você ganhou :)", "Puxa!!! Você perdeu :(", "Empate!!! Tente novamente :/") utilizando o método setState() para reconstruir a interface do usuário com o novo resultado.
var _resultadoFinal = "Boa sorte!!!";

if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
    (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
  setState(() {
    _resultadoFinal = "Parabéns!!! Você ganhou :)";
  });
} else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
    (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
    (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
  setState(() {
    _resultadoFinal = "Puxa!!! Você perdeu :(";
  });
} else {
  setState(() {
    _resultadoFinal = "Empate!!! Tente novamente :/";
  });
}

14. Exibindo o Resultado na UI:
Um widget Padding contendo um widget Text é adicionado abaixo das imagens de escolha para exibir o valor da variável _resultadoFinal. O estilo do texto (tamanho e peso da fonte, alinhamento) também é definido.
Padding(
  padding: EdgeInsets.only(top: 32, bottom: 16),
  child: Text(
    _resultadoFinal,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
),

15. Código-Fonte Completo:
Os documentos fornecem o código-fonte completo dos arquivos main.dart e jogo.dart, ilustrando a estrutura completa do aplicativo e a implementação das funcionalidades descritas.

main.dart (Parte 2):
import 'package:flutter/material.dart';
import 'package:jokenpo/jogo.dart';

void main() {
  runApp(MaterialApp(
    home: Jogo(),
  ));
}
jogo.dart (Parte 2):
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);

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
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
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
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: const Image(
                  image: AssetImage('images/pedra.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: const Image(
                  image: AssetImage('images/papel.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: const Image(
                  image: AssetImage('images/tesoura.png'),
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

Este documento detalha a criação de um aplicativo JokenPo em Flutter, abrangendo desde a configuração inicial até a implementação da lógica do jogo e a exibição dos resultados, incluindo trechos de código e a explicação do processo de adição e referência de imagens no projeto, garantindo o seu correto "versionamento" dentro da estrutura do Flutter com base nas informações fornecidas nos documentos "PDF 2 - App JokenPo em Flutter - Parte 1.pdf" e "PDF 3 - App JokenPo em Flutter - Parte 2.pdf
