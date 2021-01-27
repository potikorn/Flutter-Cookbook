import 'package:cookbook/model/dog_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DogHelper {
  static Database _database;

  DogHelper._privateConstructor();

  static final DogHelper instance = DogHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), "doggie_database.db"),
        onCreate: (Database database, int version) {
      return database.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
    }, version: 1);
  }

  Future<int> insertDog(Dog dog) async {
    Database db = await instance.database;
    var res = await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<Dog>> getDogs() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query("dogs");
    return List.generate(
      maps.length,
      (index) => Dog(
        id: maps[index]["id"],
        name: maps[index]["name"],
        age: maps[index]["age"],
      ),
    );
  }

  Future<void> updateDog(Dog dog) async {
    Database db = await instance.database;
    try {
      await db.update(
        "dogs",
        dog.toMap(),
        where: "id = ?",
        whereArgs: [dog.id],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteDog(int id) async {
    Database db = await instance.database;
    try {
      await db.delete(
        "dogs",
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
