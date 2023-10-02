import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  TitleHome(this.startPlay_call, {super.key});

  VoidCallback startPlay_call;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: Image.asset('assets/images/home.jpg')),
        const SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Welcome to the Astronomy Quiz!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color(0xFFF0F0F0)),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
          margin: const EdgeInsets.all(60),
          child: ElevatedButton(
            onPressed: startPlay_call,
            child: const Text(
              'Play Quiz',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF0F0F0)),
            ),
          ),
        ),
      ],
    );
  }
}
