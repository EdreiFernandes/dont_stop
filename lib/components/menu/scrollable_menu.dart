import 'package:flutter/material.dart';
import 'package:tapple_app/components/menu/menu_button.dart';
import 'package:tapple_app/utils/screensizer.dart';

class ScrollableMenu extends StatelessWidget {
  const ScrollableMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().getHeight(context, dividedBy: 3.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: ScreenSize().getHeight(context, dividedBy: 40),
          horizontal: ScreenSize().getWidth(context, dividedBy: 50),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            MenuButton(
              label: "Cards",
            ),
            MenuButton(
              label: "HTP",
            ),
            MenuButton(
              label: "Config",
            ),
          ],
        ),
      ),
    );
  }
}
