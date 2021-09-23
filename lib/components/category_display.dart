import 'package:flutter/material.dart';

class CategoryDisplay extends StatelessWidget {
  const CategoryDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        right: _mediaSize.width / 30,
        left: _mediaSize.width / 30,
        top: _mediaSize.height / 50,
      ),
      child: Container(
        width: _mediaSize.width,
        height: _mediaSize.height / 5,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(_mediaSize.width / 30),
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
