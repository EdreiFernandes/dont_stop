import 'package:dont_stop/screens/categories_editor.dart';
import 'package:dont_stop/utils/screensizer.dart';
import 'package:flutter/material.dart';

import 'menu_button.dart';

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
              label: "Cartas de categorias",
              icone: Icons.layers,
              navigatorDestiny: CategoriesEditor(),
            ),
            MenuButton(
              label: "Como jogar?",
              icone: Icons.auto_stories,
              navigatorDestiny: CategoriesEditor(),
            ),
            MenuButton(
              label: "Configurações",
              icone: Icons.settings,
              navigatorDestiny: CategoriesEditor(),
            ),
          ],
        ),
      ),
    );
  }
}
