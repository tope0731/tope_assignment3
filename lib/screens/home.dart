import 'package:carpio_science_quiz/components/titlehome.dart';
import 'package:carpio_science_quiz/screens/questions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toPlay = false;

  void startPlay() {
    setState(() {
      toPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF213555),
        title: const Center(
            child: Text(
          'Science Quiz',
        )),
      ),
      backgroundColor: const Color(0xFF213555),
      body: toPlay ? const Questions() : TitleHome(startPlay),
    );
  }
}
