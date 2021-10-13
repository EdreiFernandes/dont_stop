import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tapple_app/database/dao/category_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'tapple.dp');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CategoryDao.tableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
