import 'package:carpio_science_quiz/data/question_list.dart';
import 'package:carpio_science_quiz/screens/home.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;
  final questions = QUESTION_LIST;
  String grade = '';
  //String choice1 = '', choice2 = '', choice3 = '', choice4 = '';

  void checkAnswer(dynamic ans) {
    //print(ans);
    score += ans == questions[questionIndex]['answers'] ? 1 : 0;
    //print(score);
    setState(() {
      questionIndex++;
    });
    if (questionIndex == questions.length) {
      isFinished = true;
      if (score >= 9) {
        grade = 'Perfect!!!';
      } else if (score >= 6) {
        grade = 'That\'s good!!';
      } else {
        grade = 'You Failed!';
      }
    }
  }

  Widget showQuestion() {
    // choiceCounter();
    // choice1 = questions[questionIndex]['choices'][0].toString();
    // choice2 = questions[questionIndex]['choices'][1].toString();
    // choice3 = questions[questionIndex]['choices'][2].toString();
    // choice4 = questions[questionIndex]['choices'][3].toString();

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "${questions[questionIndex]['textQuestion']}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Color(0xFFF0F0F0),
            ),
          )),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () =>
                  checkAnswer(questions[questionIndex]['choices'][0]),
              child: Text(
                questions[questionIndex]['choices'][0],
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFF0F0F0),
                ),
              )),
          ElevatedButton(
              onPressed: () =>
                  checkAnswer(questions[questionIndex]['choices'][1]),
              child: Text(questions[questionIndex]['choices'][1])),
          ElevatedButton(
            onPressed: () =>
                checkAnswer(questions[questionIndex]['choices'][2]),
            child: Text(questions[questionIndex]['choices'][2]),
          ),
          ElevatedButton(
              onPressed: () =>
                  checkAnswer(questions[questionIndex]['choices'][3]),
              child: Text(questions[questionIndex]['choices'][3])),
        ],
      ),
    );
  }

  Widget showScore() {
    return Container(
      margin: const EdgeInsets.all(50),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$grade',
            style: const TextStyle(fontSize: 30, color: Color(0xFFF0F0F0)),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '$score/${questions.length}',
            style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF0F0F0)),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            child: const Text(
              "Try Again",
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: isFinished ? showScore() : showQuestion()),
      ],
    );
  }
}
