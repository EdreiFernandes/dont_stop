import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:dont_stop/app/screens/game.dart';
import 'package:flutter/material.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize().getWidth(context, dividedBy: 12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: ScreenSize().getWidth(context, dividedBy: 2),
                  ),
                  Text(
                    "Iniciar partida",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSize().getWidth(context, dividedBy: 8.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
