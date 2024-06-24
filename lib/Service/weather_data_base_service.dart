import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WeatherDatabaseHelper {
  static late Database _database;
  static const String dbName = 'weather.db';
  static const String weatherTable = 'weather';
  static const String idColumn = 'id';
  static const String jsonDataColumn = 'json_data';

  static Future<void> initializeDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, dbName);

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            '''
          CREATE TABLE $weatherTable (
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $jsonDataColumn TEXT
          )
          '''
        );
      },
    );
  }

  static Future<int> insertWeatherData(String jsonData) async {
    await _database.insert(
      weatherTable,
      { jsonDataColumn: jsonData },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return 1;
  }

  static Future<List<String>> getAllWeatherData() async {
    final List<Map<String, dynamic>> maps = await _database.query(weatherTable);

    return List.generate(maps.length, (i) {
      return maps[i][jsonDataColumn];
    });
  }

  static Future<void> deleteWeatherData(int id) async {
    await _database.delete(
      weatherTable,
      where: '$idColumn = ?',
      whereArgs: [id],
    );
  }
}
