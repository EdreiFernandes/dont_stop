import 'package:flutter/material.dart';
import 'package:tapple_app/components/menu/play_button.dart';
import 'package:tapple_app/components/menu/scrollable_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayButton(),
          ScrollableMenu(),
        ],
      ),
    );
  }
}
