import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();

  static Database? _database;

  DataBaseHelper._init();

  Future<Database?> get database async {
    print(_database);
    if (_database != null) return _database!;

    _database = await initDB('FlutterProject');
    return _database!;
  }

  initDB(String dbName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);

    print('Database Path:$path');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  static const databaseTableName = 'User_Data_Table';
  static const userPhoneNumber = 'User_Phone_Number'; //primary key
  static const userName = 'User_Name';
  static const userLocation = 'User_Location';
  static const userPhoto = 'User_Photo';

  Future onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $databaseTableName(
        $userPhoneNumber INTEGER PRIMARY KEY,
        $userName TEXT NOT NULL,
        $userLocation TEXT NOT NULL,
        $userPhoto TEXT NOT NULL
      )
''');
  }

  // insert data
  insertRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(databaseTableName, row);
  }

  //read data
  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database? db = await instance.database;
    return await db!.query(databaseTableName);
  }

  //update data
  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int phoneNumber = row[userPhoneNumber];
    return await db!.update(databaseTableName, row,
        where: '$userPhoneNumber=?', whereArgs: [phoneNumber]);
  }

  Future<int> deleteRecord(int phoneNumber) async {
    Database? db = await instance.database;
    return await db!.delete(databaseTableName,
        where: '$userPhoneNumber=?', whereArgs: [phoneNumber]);
  }
}
