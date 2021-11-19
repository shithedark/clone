import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clone/android/database/database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  DatabaseBloc() : super(DatabaseOpen()) {
    on<DatabaseEvent>((event, emit) async {
      if(event is CreateDatabase){
        emit(CreateDatabaseRequested());
        if(Platform.isAndroid){
          Database database = await databaseHelper.getDatabase();
          if(database.isOpen){
            if(await databaseHelper.getFirstTime() == 1){

              emit(FirstTime());
              int id = await  database.rawUpdate('UPDATE ApplicationLevel SET firstTime = ? WHERE firstTime = 1',
                  ['0']);

            }

          }
        }
      }
    });
  }
}
