import 'dart:io';
import 'package:libercount/models/livro.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SimpleDataBase {
  static final _databaseName = "SimpleDataBase.db";
  static final _databaseVersion = 1;

  SimpleDataBase._privateConstructor();
  static final SimpleDataBase instance = SimpleDataBase._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE livro(
      codigo TEXT)''');
  }

  Future insert(Livro livro) async {
    Database db = await instance.database;
    try {
      await db.insert(
        'livro',
        livro.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (e) {
      return;
    }
  }

  Future<List<Livro>> list() async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT * FROM livro');
    List<Livro> livro = [];
    if (res != null) {
      for (var a in res) {
        livro.add(
          Livro(
            codigo: a.values.elementAt(0),
          ),
        );
      }
    }
    return res != null ? livro : [];
  }

  Future<void> deleteTable() async {
    Database db = await instance.database;
    return await db.execute('''DELETE FROM livro''');
  }
}
