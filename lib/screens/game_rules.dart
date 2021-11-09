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
  late String pdfPath;

  @override
  void initState() {
    super.initState();

    getFileFromAsset(pdfName).then((file) => {
          setState(() {
            pdfPath = file.path;
            print(pdfPath);
          })
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
      throw Exception("Error opening asset files");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("-------"),
        ),
        body: Center(
          child: Builder(
              builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("Open PDF"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfViewPage(
                                        path: pdfPath,
                                      )));
                        },
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key? key, required this.path}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manual de regras"),
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages ?? 0;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController viewController) {
              _pdfViewController = viewController;
            },
            onPageChanged: (int? page, int? total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage + 1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
