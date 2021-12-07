import 'package:dont_stop/app/screens/game.dart';
import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Seu tempo acabou!"),
      content: Text("Obrigado por jogar. O que vamos fazer agora?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
          },
          child: Text("Voltar ao menu"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Game()),
              ModalRoute.withName('/'),
            );
          },
          child: Text("Jogar de novo"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            primary: Colors.white,
          ),
        )
      ],
    );
  }
}
