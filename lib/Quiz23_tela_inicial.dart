import 'Quiz23.dart';
import 'package:flutter/material.dart';

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