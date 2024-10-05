import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: data['user_answer'] ==
                                      data['correct_answer']
                                  ? const Color.fromARGB(255, 149, 249, 153)
                                  : const Color.fromARGB(255, 237, 124, 116),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Text(
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              ((data['question_index'] as int) + 1).toString()),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['question'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 240, 189, 189)),
                                    data['user_answer'] as String),
                                Text(
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 189, 240, 218)),
                                    data['correct_answer'] as String),
                              ]),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
