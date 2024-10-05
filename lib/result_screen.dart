import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.resetScreen, required this.chosenAnswers});
  final List<String> chosenAnswers;
  final void Function() resetScreen;
  List<Map<String, Object>> get SummaryData {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].choices[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  // get CorrectNumber {
  //   int ans = 0;
  //   for (var i = 0; i < chosenAnswers.length; i++) {
  //     if (questions[i].choices[0] == chosenAnswers[i]) {
  //       ans += 1;
  //     }
  //   }
  //   return ans;
  // }

  @override
  Widget build(BuildContext context) {
    final summary = SummaryData;
    final int correctCount = summary
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                style: GoogleFonts.protestStrike(
                    fontSize: 22,
                    color: const Color.fromARGB(255, 248, 193, 247)),
                "You answered $correctCount questions out of ${chosenAnswers.length} correctly! "),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18)),
                onPressed: resetScreen,
                icon: Icon(Icons.restart_alt_rounded),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
