import 'package:flutter/material.dart';
import 'package:tapple_app/utils/screensizer.dart';

class MenuButton extends StatelessWidget {
  final Widget navigatorDestiny;
  final String label;

  const MenuButton({Key? key, required this.label, required this.navigatorDestiny}) : super(key: key);

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
          child: Center(
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
