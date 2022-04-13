import 'package:dont_stop/app/utils/screensizer.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Widget navigatorDestiny;
  final String label;
  final IconData icone;

  const MenuButton(
      {Key? key,
      required this.label,
      required this.navigatorDestiny,
      required this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigatorDestiny),
          );
        },
        child: SizedBox(
          width: ScreenSize().getWidth(context, dividedBy: 2.2),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize().getWidth(context, dividedBy: 40.0),
              vertical: ScreenSize().getWidth(context, dividedBy: 20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    icone,
                    color: Colors.white,
                    size: ScreenSize().getWidth(context, dividedBy: 7.5),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenSize().getWidth(context, dividedBy: 16.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
