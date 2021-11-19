part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  @override
  List<Object> get props => [];
}

class CreateDatabaseRequested extends DatabaseState {
  @override
  List<Object?> get props => [];
}


class DatabaseOpen extends DatabaseState {
  @override
  List<Object?> get props => [];
}
class DatabaseNotOpen extends DatabaseState {
  @override
  List<Object?> get props => [];
}

class NotFirstTime extends DatabaseState {
  @override
  List<Object?> get props => [];
}


class FirstTime extends DatabaseState {
  @override
  List<Object?> get props => [];
}
