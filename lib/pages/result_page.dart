import 'package:flutter/material.dart';
import 'package:simple_word_rearrange_game/pages/start_page.dart';

class ResultPage extends StatefulWidget {
  static const String routeName = '/resultPage';
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List? resultList;
  late int correct;
  late int inCorrect;

  @override
  void didChangeDependencies() {
    resultList = ModalRoute.of(context)?.settings.arguments as List<int>;
    correct = resultList?[0];
    inCorrect = resultList?[1];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Correct: $correct',
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Incorrect: $inCorrect',
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Colors.indigoAccent.shade100,
              shadowColor: Colors.lightBlue.shade300,
              elevation: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, StartPage.routeName);
                },
                child: const Text(
                  'Start Over',
                  style: TextStyle(fontSize: 30, color: Colors.black45),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
