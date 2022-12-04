import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  static const routeName = '/startPage';
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
              width: 350,
              child: Text(
                'English Word Rearranging Game',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              color: Colors.indigoAccent.shade100,
              shadowColor: Colors.lightBlue.shade300,
              elevation: 50,
              child: SizedBox(
                height: 50,
                width: 100,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
