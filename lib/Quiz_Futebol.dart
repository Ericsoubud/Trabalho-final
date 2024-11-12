import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Futebol',
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
        title: Text('Quiz Futebol'),
      ),
      backgroundColor: const Color.fromARGB(255, 147, 22, 219),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0EDgg7Pu2xXXUy3I6N7Gp42BIOLUBKNTOBZGT4OQBmebQSpdulx8FlOCfF_xwpy2oKGE&usqp=CAU',
              height: 300,
            ),
            SizedBox(height: 40),
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

  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1- Quem ganhou o Ballon Dor 2024?',
      'options': ['Vinicius Jr', 'Messi', 'Rodri', 'Neymar Jr'],
      'answer': 2,
      'imagem': 'lib/assets/ballon.png',
    },
    {
      'question': '2- Quem é o líder do campeonato brasileiro atualmente?',
      'options': ['Botafogo', 'Bahia', 'Vasco', 'Flamengo'],
      'answer': 0,
      'imagem': 'lib/assets/brasileiru.jpeg'
    },
    {
      'question': '3- Quantos times são rebaixados no campeonato brasileiro?',
      'options': ['5', '4', '7', '3'],
      'answer': 1,
      'imagem': 'lib/assets/brasileiru.jpeg'
    },
    {
      'question': '4- Quem ganhou o Golden Boy 2024?',
      'options': ['Lamine Yamal', 'Pedri', 'Gavi', 'Neymar Jr'],
      'answer': 0,
      'imagem': 'lib/assets/lamine.jpeg',
    },
    {
      'question': '5- Quem ganhou o prêmio Puskás 2015?',
      'options': [
        'Wendell Lira',
        'Neymar Jr',
        'Cristiano Ronaldo',
        'Fernando Torres'
      ],
      'answer': 0,
      'imagem': 'lib/assets/ballon.png',
    },
    {
      'question': '6- Qual time foi campeão da UEFA Champions League 2015?',
      'options': ['Real Madrid', 'Barcelona', 'Juventus', 'Arsenal'],
      'answer': 1,
      'imagem': 'lib/assets/league.jpeg',
    },
    {
      'question': '7- Quantos títulos da UEFA Champions League o Barcelona tem?',
      'options': ['5', '6', '12', '15'],
      'answer': 0,
      'imagem': 'lib/assets/league.jpeg',
    },
    {
      'question': '8- Qual seleção ganhou a Copa do Mundo de 2018?',
      'options': ['França', 'Brasil', 'Bélgica', 'Alemanha'],
      'answer': 0,
      'imagem': 'lib/assets/copa.jpeg',
    },
    {
      'question': '9- Quantas Bolas de Ouro Cristiano Ronaldo tem?',
      'options': ['5', '6', '12', '15'],
      'answer': 0,
      'imagem': 'lib/assets/ballon.png',
      
    },
    {
      'question': '10- Qual time se consagrou campeão da Copa Libertadores da América em 2019?',
      'options': ['River Plate', 'Flamengo', 'Palmeiras', 'Bolívar'],
      'answer': 1,
      'imagem': 'lib/assets/brasileiru.jpeg',
      
    }
  ];
  


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
        });
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
              _resetQuiz();
            },
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
      _feedbackMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Futebol'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizQuestion()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Parabéns! Você concluiu o quiz!',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0EDgg7Pu2xXXUy3I6N7Gp42BIOLUBKNTOBZGT4OQBmebQSpdulx8FlOCfF_xwpy2oKGE&usqp=CAU',
                    height: 200,
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
              height: 150,
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
        ],
      ),
    );
  }
}
