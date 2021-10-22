import 'package:dont_stop/database/dao/category_dao.dart';
import 'package:dont_stop/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesEditor extends StatefulWidget {
  const CategoriesEditor({Key? key}) : super(key: key);

  @override
  State<CategoriesEditor> createState() => _CategoriesEditorState();
}

class _CategoriesEditorState extends State<CategoriesEditor> {
  final CategoryDao _categoryDao = new CategoryDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de categorias"),
        ),
        body: FutureBuilder<List<Category>>(
          initialData: [],
          future: _categoryDao.getAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Loading')
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Category>? categories = snapshot.data;

                if (categories != null) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Category category = categories[index];
                      return _CategoryItem(category);
                    },
                    itemCount: categories.length,
                  );
                }
                break;
            }

            return Text('Unknown error!');
          },
        ));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  _CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          category.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
