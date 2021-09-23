import 'package:flutter/material.dart';
import 'package:tapple_app/utils/screensizer.dart';

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenSize().getWidth(context, dividedBy: 30.0),
        left: ScreenSize().getWidth(context, dividedBy: 30.0),
        top: ScreenSize().getHeight(context, dividedBy: 50.0),
      ),
      child: Container(
        height: ScreenSize().getHeight(context, dividedBy: 5.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            ScreenSize().getWidth(context, dividedBy: 30.0),
          ),
          child: Center(
            child: Text(
              "Category", // TODO Alterar categoria por rodada
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
