import 'package:flutter/material.dart';
import 'package:tapple_app/components/category_display.dart';
import 'package:tapple_app/components/letter_selector/letter_selector.dart';
import 'package:tapple_app/components/progress_bar.dart';
import 'package:tapple_app/components/timer_button.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  ProgressBar(),
                  CategoryDisplay(),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TimerButton(),
                  LetterSelector(),
                ],
              ),
            ),
          ],
        ));
  }
}
