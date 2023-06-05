// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:web_project/models/user_details.dart';

// final String tableName = 'User_Details';

// class DataBaseHelper {
//   static final DataBaseHelper instance = DataBaseHelper._init();

//   static Database? _database;

//   DataBaseHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('contacts.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final textType = 'TEXT NOT NULL';
//     final boolType = 'BOOLEAN NOT NULL';
//     final integerType = 'INTEGER NOT NULL';

//     await db.execute('''
// CREATE TABLE $tableName ( 
//   ${UserDetails.id} $idType,
//   ${UserDetails.name} $textType, 
//   ${UserDetails.mobileNumber} $textType,
//   ${UserDetails.location} $textType,
//   ${UserDetails.photo} $textType
//   )
// ''');
//   }

//   // insert data
//   insertRecord(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     return await db!.insert(tableName, row);
//   }

//   //read data
//   Future<List<Map<String, dynamic>>> queryDatabase() async {
//     Database? db = await instance.database;
//     return await db!.query(tableName);
//   }

//   //update data
//   Future<int> updateRecord(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     int phoneNumber = row[ UserDetails.mobileNumber];
//     return await db!.update(databaseTableName, row,
//         where: '$userPhoneNumber=?', whereArgs: [phoneNumber]);
//   }

//   Future<int> deleteRecord(int phoneNumber) async {
//     Database? db = await instance.database;
//     return await db!.delete(databaseTableName,
//         where: '$userPhoneNumber=?', whereArgs: [phoneNumber]);
//   }
// }
