import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("O tempo acabou!"),
      content: Text("Agora sou um componente separado. O que você quer fazer?"),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Voltar ao menu"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Jogar de novo"),
        )
      ],
    );
  }
}
