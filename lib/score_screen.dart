import 'package:flutter/material.dart';
class ScoreScreen extends StatelessWidget {
 late final int score;

 ScoreScreen(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('score'),
      ),
      body: Column(
        children: [
          Text('Score is $score'),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Refresh')
          ),
        ],
      ),
    );
  }
}
