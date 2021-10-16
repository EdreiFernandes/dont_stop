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

  static List<Category> _defaultCategories = [
    new Category(0, "Super-heróis", 1, 1),
    new Category(0, "Sabores de sorvete", 1, 1),
    new Category(0, "Nomes femininos", 1, 1),
    new Category(0, "Nomes masculino", 1, 1),
    new Category(0, "Tem na geladeira", 1, 1),
    new Category(0, "Marcas", 1, 1),
    new Category(0, "Sabores de pizza", 1, 1),
    new Category(0, "Cidade, Estado, País", 1, 1),
    new Category(0, "Idiomas", 1, 1),
    new Category(0, "Times de futebol", 1, 1),
    new Category(0, "Animais", 1, 1),
    new Category(0, "Músicas", 1, 1),
    new Category(0, "Esportes", 1, 1),
  ];

  Future<int> save(Category category) async {
    final Database db = await getDatabase();
    Map<String, dynamic> categoryMap = _toMap(category);
    return db.insert(_tableName, categoryMap);
  }

  Future<List<Category>> getAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Category> categories = _toList(result);
    return categories;
  }

  Future<Category> getRandom() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      orderBy: "RANDOM()",
      limit: 1,
    );
    Category category = _toList(result).first;
    return category;
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

  static String insertDefaultValues() {
    StringBuffer query = new StringBuffer();
    query.write(
        'INSERT INTO $_tableName ($_name, $_difficultyLevel, $_active) VALUES');
    for (Category category in _defaultCategories) {
      query.write("('${category.name}',");
      query.write("${category.difficultyLevel.toString()},");
      query.write("${category.active.toString()}),");
    }

    return _removeLastCharacter(query.toString());
  }

  static String _removeLastCharacter(String text) {
    return text.substring(0, text.length - 1);
  }
}
