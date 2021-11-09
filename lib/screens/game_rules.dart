import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class GameRules extends StatefulWidget {
  const GameRules({Key? key}) : super(key: key);

  @override
  State<GameRules> createState() => _GameRulesState();
}

class _GameRulesState extends State<GameRules> {
  String pdfName = "gamerules.pdf";
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
        future: getFileFromAsset(pdfName),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Manual de regras"),
            ),
            body: Center(
              child: snapshot.hasData
                  ? PDFView(
                      filePath: snapshot.data!.path,
                      autoSpacing: true,
                      enableSwipe: true,
                      pageSnap: true,
                      swipeHorizontal: true,
                      nightMode: false,
                      onPageChanged: (page, total) {
                        setState(() {
                          _currentPage = (page ?? 0) + 1;
                        });
                      },
                    )
                  : CircularProgressIndicator(),
            ),
            floatingActionButton: FloatingActionButton(
              child: Text(_currentPage.toString()),
              tooltip: "Current page", //"Go to a specific page",
              onPressed: () {},
            ),
          );
        });
  }

  Future<File> getFileFromAsset(String filename) async {
    try {
      var data = await rootBundle.load("assets/$filename");
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Occur an error opening asset file!");
    }
  }
}
