import 'package:dont_stop/app/components/game/category_display.dart';
import 'package:dont_stop/app/components/game/letter_selector/letter_selector.dart';
import 'package:dont_stop/app/components/game/progress_bar.dart';
import 'package:dont_stop/app/components/game/timer_button.dart';
import 'package:dont_stop/app/services/keyboard_memory_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Game extends StatelessWidget {
  final KeyboardMemoryService keyboardMemoryService = Modular.get();

  Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    keyboardMemoryService.clearLetterStatus();
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
