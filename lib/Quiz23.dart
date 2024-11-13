import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Hard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epic Quiz Neymar Jr'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://d9radp1mruvh.cloudfront.net/media/challenge_img/istockphoto-1223692043-612x612.jpg',
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao Quiz Neymar Jr!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Teste seus conhecimentos sobre a carreira e vida de Neymar Jr. Boa sorte!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
              child: Text('Iniciar Quiz', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String _feedbackMessage = '';
  Color _feedbackColor = Colors.black;
  int _timeLeft = 15;
  Timer? _timer;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1- QUANTOS ANOS NEYMAR JR TEM?',
      'options': ['30', '28', '31', '27'],
      'answer': 2,
      'imagem': 'lib/assets/N1.jpeg',
    },
    {
      'question': '2- QUANTOS GOLS NEYMAR JR TEM PELA SELEÇÃO?',
      'options': ['79', '80', '100', '56'],
      'answer': 0,
      'imagem': 'lib/assets/N2.jpeg'
    },
    {
      'question': '3- QUAIS DESSES TIMES NEYMAR JR NUNCA JOGOU?',
      'options': ['SANTOS', 'AL AHLY', 'BARCELONA', 'PSG'],
      'answer': 1,
      'imagem': 'lib/assets/N3.jpeg'
    },
    {
      'question': '4- EM QUE ANO NEYMAR CONQUISTOU SUA PRIMEIRA CHAMPIONS LEAGUE?',
      'options': ['2015', '2020', '2014', '2017'],
      'answer': 0,
      'imagem': 'lib/assets/N4.jpeg',
    },
    {
      'question': '5- QUANTOS GOLS NEYMAR JR TEM EM TODA SUA CARREIRA?',
      'options': ['439', '500', '291', '314'],
      'answer': 0,
      'imagem': 'lib/assets/N5.jpeg',
    },
    {
      'question': '6- QUAL É O NOME VERDADEIRO DE NEYMAR JR?',
      'options': ['NEYMAR PEREIRA DE SOUZA', 'NEYMAR DA SILVA SANTOS JUNIOR', 'NEYMAR JUNIOR DA SILVA', 'NEYMAR SANTOS JUNIOR'],
      'answer': 1,
      'imagem': 'lib/assets/N6.jpeg',
    },
    {
      'question': '7- QUANTOS TITULOS NEYMAR JR TEM EM TODA SUA CARREIRA?',
      'options': ['40', '20', '27', '37'],
      'answer': 3,
      'imagem': 'lib/assets/N7.jpeg',
    },
    {
      'question': '8- CONTRA QUAL SELEÇÃO NEYMAR JR MARCOU SEU PRIMEIRO GOL NAS COPAS DO MUNDO, EM 2014?',
      'options': ['COLÔMBIA', 'CROÁCIA', 'CHILE', 'ALEMANHA'],
      'answer': 1,
      'imagem': 'lib/assets/N8.jpeg',
    },
    {
      'question': '9- QUAL FOI O VALOR ESTIMADO DA TRANSFERÊNCIA DE NEYMAR JR PARA EM 2017, A MAIS CARA DA HISTÓRIA?',
      'options': ['150 MILHOES DE EUROS', '250 MILHOES DE EUROS', '222 MILHOES DE EUROS', '155 MILHOES DE EUROS'],
      'answer': 2,
      'imagem': 'lib/assets/N9.jpeg',
    },
    {
      'question': '10- QUAL COMPETIÇÃO NEYMAR JR GANHOU COM A SELEÇÃO EM 2013?',
      'options': ['COPA AMÉRICA', 'COPA DAS CONFEDERAÇÕES', 'ELIMINATORIAS DA COPA', 'COPA DO MUNDO SUB-20'],
      'answer': 1,
      'imagem': 'lib/assets/N10.jpeg',
    }
  ];

  void _startTimer() {
    _timeLeft = 15;
    _timer?.cancel(); 
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
        _answerQuestion(-1); 
      }
    });
  }

  void _answerQuestion(int selectedOption) {
    if (_currentQuestionIndex < _questions.length) {
      if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
        _score++;
        setState(() {
          _feedbackMessage = 'Resposta correta!';
          _feedbackColor = Colors.green;
        });
      } else {
        setState(() {
          _feedbackMessage = 'Resposta errada!';
          _feedbackColor = Colors.red;
        });
      }

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _currentQuestionIndex++;
          _feedbackMessage = '';
          _timeLeft = 15;
        });
        _startTimer(); 
      });

      if (_currentQuestionIndex >= _questions.length) {
        Future.delayed(Duration(seconds: 1), _showScoreDialog);
      }
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Concluído!'),
        content: Text('Você acertou $_score de ${_questions.length} perguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer for the first question
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epic Quiz Neymar Jr'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizQuestion()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PARABÉNS! VOCÊ É FÃ DO MENINO NEY MESMO!!',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Você acertou $_score de ${_questions.length} perguntas.',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 221, 44)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sua pontuação: ${((_score / _questions.length) * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 3, 233, 91)),
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    'lib/assets/N.BB.jpg',
                    height: 300,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildQuizQuestion() {
    final question = _questions[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (question.containsKey('imagem'))
            Image.asset(
              question['imagem'],
              height: 300,
            ),
          SizedBox(height: 20),
          Text(
            question['question'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...List.generate(question['options'].length, (index) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(index),
              child: Text(question['options'][index]),
            );
          }),
          SizedBox(height: 20),
          Text(
            _feedbackMessage,
            style: TextStyle(fontSize: 18, color: _feedbackColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Tempo restante: $_timeLeft segundos',
            style: TextStyle(fontSize: 18, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
