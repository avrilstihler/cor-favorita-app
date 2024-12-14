import 'package:flutter/material.dart';

void main() {
  runApp(const FavoriteColorApp());
}

class FavoriteColorApp extends StatelessWidget {
  const FavoriteColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quem é você pela sua cor favorita?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorPersonalityPage(),
    );
  }
}

class ColorPersonalityPage extends StatefulWidget {
  const ColorPersonalityPage({super.key});

  @override
  State<ColorPersonalityPage> createState() => _ColorPersonalityPageState();
}

class _ColorPersonalityPageState extends State<ColorPersonalityPage> {
  String _description = "Escolha uma cor para descobrir sua personalidade!";
  Color _backgroundColor = Colors.white;

  final Map<Color, String> _colorPersonalities = {
    Colors.red: "A cor vermelha está associada à paixão e à ação. Se você escolheu esta cor, você é uma pessoa cheia de energia, determinação e sempre pronta para se envolver profundamente nas emoções da vida. Você ama viver intensamente e se joga de cabeça em tudo o que faz.",
    Colors.orange: "A cor laranja simboliza entusiasmo, criatividade e vitalidade. Se você escolheu essa cor, você é uma pessoa alegre, otimista e cheia de disposição. Sua energia é contagiante, e você tem uma habilidade natural de inspirar os outros ao seu redor a se divertirem e se expressarem livremente.",
    Colors.yellow: "O amarelo representa a alegria, a inteligência e a energia positiva. Se sua cor favorita é o amarelo, você é uma pessoa otimista, criativa e com uma visão brilhante da vida. Você sempre busca novas ideias e está sempre pronto para encontrar soluções inovadoras para qualquer desafio.",
    Colors.green: "O verde é a cor da natureza, da calma e do equilíbrio. Se você escolheu essa cor, você é uma pessoa tranquila, equilibrada e sensível. Você valoriza a harmonia em sua vida e se sente mais feliz e energizado quando está em sintonia com a natureza e com os outros.",
    Colors.blue: "O azul é uma cor que transmite serenidade, confiança e clareza. Se você escolheu o azul, você é uma pessoa calma, confiável e introspectiva. Sua mente é profunda e cheia de ideias inovadoras. Você busca paz interior e transmite segurança para as pessoas ao seu redor.",
    Colors.indigo: "O índigo, uma mistura de azul escuro e roxo, é a cor da intuição e da sabedoria. Se você escolheu essa cor, você é uma pessoa introspectiva, com uma visão única sobre o mundo. Você tem uma intuição aguçada e valoriza o autoconhecimento e a reflexão profunda.",
    Colors.purple: "O roxo é associado à espiritualidade, à criatividade e ao mistério. Se você escolheu essa cor, você é uma pessoa criativa, com um espírito livre e inovador. Você adora explorar novas ideias e procurar significados mais profundos nas coisas, sempre buscando ir além do óbvio.",
    Colors.pink: "O rosa é a cor do amor, da empatia e da doçura. Se você escolheu essa cor, você é uma pessoa sensível, carinhosa e atenciosa. Você é uma pessoa que valoriza o amor em todas as suas formas e tem uma natureza acolhedora e afetuosa para com os outros.",
    Colors.black: "O preto representa sofisticação, mistério e poder. Se você escolheu essa cor, você é uma pessoa introspectiva e elegante. Você valoriza a profundidade, o silêncio e, muitas vezes, prefere o mundo interno ao externo. Seu estilo é marcado pela discrição e pela força interior.",
    Colors.white: "O branco é a cor da paz, da pureza e da clareza. Se você escolheu essa cor, você é uma pessoa que busca simplicidade e equilíbrio. Sua presença transmite calma e você tem uma energia renovadora. Você se esforça para manter a paz e a harmonia em sua vida e no ambiente ao seu redor.",
    Colors.grey: "O cinza é a cor da neutralidade, equilíbrio e introspecção. Se você escolheu essa cor, você é uma pessoa prática, focada e racional. Você tende a manter a calma em situações difíceis e gosta de encontrar soluções equilibradas para os desafios da vida.",
    Colors.brown: "O marrom é a cor da estabilidade, segurança e terra. Se você escolheu essa cor, você é uma pessoa sólida, confiável e com os pés no chão. Você valoriza a simplicidade e tem uma conexão profunda com o mundo natural. Seu senso de estabilidade e lealdade faz com que seja uma presença tranquila para os outros.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor.withOpacity(0.7),
        title: const Text(
          'Quem é você pela sua cor favorita?',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Descrição da cor escolhida
          Expanded(
            flex: 3,
            child: Container(
              color: _backgroundColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                _description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _backgroundColor == Colors.black ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
          // Grid de cores com botões menores e centralizados
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: _colorPersonalities.keys.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _backgroundColor = color;
                      _description = _colorPersonalities[color]!;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    width: 70,
                    height: 70,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _backgroundColor = Colors.white;
            _description = "Escolha uma cor para descobrir sua personalidade!";
          });
        },
        tooltip: 'Reset',
        backgroundColor: Colors.black,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
