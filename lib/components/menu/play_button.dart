import 'package:flutter/material.dart';
import 'package:tapple_app/screens/game.dart';
import 'package:tapple_app/utils/screensizer.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenSize().getHeight(context, dividedBy: 40),
        horizontal: ScreenSize().getWidth(context, dividedBy: 50),
      ),
      child: Card(
        color: Colors.lightBlue,
        child: InkWell(
          splashColor: Colors.lightBlueAccent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Game()),
            );
          },
          child: SizedBox(
            width: ScreenSize().getWidth(context),
            height: ScreenSize().getHeight(context, dividedBy: 2),
            child: Center(
              child: Text("Play"),
            ),
          ),
        ),
      ),
    );
  }
}
