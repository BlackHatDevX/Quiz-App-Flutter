import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          scale: 2.0,
          color: const Color.fromARGB(153, 255, 255, 255),
        ),
        const SizedBox(height: 80),
        Text(
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 241, 206, 250), fontSize: 24),
            "Learn Flutter the fun way!"),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: startQuiz,
            icon: const Icon(Icons.navigate_next_outlined),
            label: const Text("Start Quiz"))
      ],
    ));
  }
}
