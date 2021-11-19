part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();
}


class CreateDatabase extends DatabaseEvent {

  @override
  List<Object?> get props => throw UnimplementedError();

}