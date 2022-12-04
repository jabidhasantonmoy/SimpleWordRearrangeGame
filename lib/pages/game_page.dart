import 'dart:async';
import 'dart:math';

import 'package:english_words/english_words.dart' as ew;
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static const routeName = '/gamePage';
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _userInput = TextEditingController();
  String selectedWord = '';
  String shuffledWord = '';
  int correct = 0;
  int inCorrect = 0;
  int index = 0;
  List<String> wordList = ew.nouns;
  final Random _random = Random.secure();
  Timer? timer;
  int count = 21;
  int timerCount = 21;
  int level = 1;
  int wordCount = 0;

  @override
  void didChangeDependencies() {
    startTimer();
    selectedWord = wordList[_random.nextInt(2000)];
    shuffledWord = shuffleWord(selectedWord);
    wordCount++;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Game'),
        actions: [
          Center(
              child: Text(
            'Next in: ${timerCount}s',
            style: const TextStyle(color: Colors.black, fontSize: 17),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blueGrey,
              height: 10,
              width: 90,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    forceStopTimer();
                    setState(() {
                      timerCount = count;
                      // int tempCorrect = correct;
                      // int tempIncorrect = inCorrect;
                      correct = 0;
                      inCorrect = 0;
                    });
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Re-arrange the word',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                shuffledWord,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _userInput,
                decoration: InputDecoration(
                  hintText: 'Enter The Correct Word',
                  //label: const Text('Word'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //String input = _userInput.text;
                      if (_userInput.text == selectedWord) {
                        correct++;
                      } else {
                        inCorrect++;
                      }
                      index = _random.nextInt(2000);
                      selectedWord = wordList[index];
                      shuffledWord = shuffleWord(selectedWord);
                      wordCount++;
                      timerCount = count;
                    });
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Correct: $correct',
                style: TextStyle(fontSize: 25, color: Colors.grey.shade400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 8, 1, 50),
              child: Text(
                'Incorrect: $inCorrect',
                style: TextStyle(fontSize: 25, color: Colors.grey.shade400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void forceStopTimer() {
    timer?.cancel();
  }

  String shuffleWord(String word) {
    List<String> tempList = word.split('');
    tempList.shuffle();
    tempList.shuffle();
    return tempList.join('');
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount > 0) {
        setState(() {
          timerCount--;
        });
      } else {
        //stopTimer();
        inCorrect++;
        index = _random.nextInt(2000);
        selectedWord = wordList[index];
        shuffledWord = shuffleWord(selectedWord);
        wordCount++;
        timerCount = count;
      }
    });
  }
}
