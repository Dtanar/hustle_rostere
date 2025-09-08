import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/data/data.dart';
import '../../utils/utils.dart';

class HustleDatasource {
  static final HustleDatasource _instance = HustleDatasource._();
  factory HustleDatasource() => _instance;

  HustleDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);

    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBKeys.dbTable}(
      ${DBKeys.idColumn}INTEGER PRIMARY KEY AUTOINCREMENT,
      ${DBKeys.titleColumn}TEXT,
      ${DBKeys.noteColumn}TEXT,
      ${DBKeys.dateColumn}TEXT,
      ${DBKeys.timeColumn}TEXT,
      ${DBKeys.categoriesColumn}TEXT,
      ${DBKeys.isCompletedColumn}INTEGER,
      
      )
  ''');
  }

  Future<int> addHustle(Hustle task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> deleteHustle(Hustle hustle) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        DBKeys.dbTable,
        where: 'id = ?',
        whereArgs: [hustle.id],
      );
    });
  }
}
