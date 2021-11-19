

import 'package:clone/consts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {

  late Database database;

  Future<int> getFirstTime()async{

    final list = await database.query('ApplicationLevel',
      columns: ['firstTime'],
    );
    return list[0]['firstTime'] as int;
  }
  Future<Database> getDatabase()async{
    String path = join(await getDatabasesPath(), "database.db");

    database = await openDatabase(path, version: databaseVersion,
    onCreate: (db , version)async{
      await db.execute('''
      CREATE TABLE ApplicationLevel (id INTEGER PRIMARY KEY ,firstTime INTEGER DEFAULT 1) 
      ''');
      await db.insert('ApplicationLevel', {
        'firstTime': 1
      });

    });

    return database;
  }
}