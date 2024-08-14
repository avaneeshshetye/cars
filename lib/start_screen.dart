import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isButtonClicked = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image0 (3).jpg'),
                fit: BoxFit
                    .fitHeight, // Cover the space horizontally without cutting
              ),
            ),
            child: const SizedBox.expand(),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'WELCOME TO Avaneesh\'s APP!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 58, 4),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isButtonClicked = true;
                  });
                  print('Button clicked!');
                },
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity:
                          isButtonClicked ? 1.0 : _animationController.value,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.startQuiz();
                          print('Button clicked!');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(15),
                        ),
                        child: Text(
                          'Click to enter',
                          style: TextStyle(
                            color: Colors.amber.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
