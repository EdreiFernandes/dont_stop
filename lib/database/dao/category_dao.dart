import 'package:sqflite/sqflite.dart';
import 'package:tapple_app/database/app_database.dart';
import 'package:tapple_app/models/category.dart';

class CategoryDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY,'
      '$_name TEXT,'
      '$_difficultyLevel INTEGER,'
      '$_active INTEGER)';

  static const String _tableName = 'category';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _difficultyLevel = 'difficulty_level';
  static const String _active = 'active';

  Future<int> save(Category category) async {
    final Database db = await getDatabase();
    Map<String, dynamic> categoryMap = _toMap(category);
    return db.insert(_tableName, categoryMap);
  }

  Future<List<Category>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Category> categories = _toList(result);
    return categories;
  }

  Map<String, dynamic> _toMap(Category category) {
    final Map<String, dynamic> categoryMap = Map();
    categoryMap[_name] = category.name;
    categoryMap[_difficultyLevel] = category.difficultyLevel;
    categoryMap[_active] = category.active;
    return categoryMap;
  }

  List<Category> _toList(List<Map<String, dynamic>> result) {
    final List<Category> categories = [];
    for (Map<String, dynamic> row in result) {
      final Category category = Category(
        row[_id],
        row[_name],
        row[_difficultyLevel],
        row[_active],
      );
      categories.add(category);
    }
    return categories;
  }
}
