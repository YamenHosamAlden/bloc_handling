import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase({
    required String databaseName,
    required int version,
    required List<String> databaseSchema,
    this.onUpgrade,
    this.onDowngrade,
    this.onOpen,
  })  {
    databaseInitializer =
        _initializeDatabase(databaseName, version, databaseSchema);
  }
  late final Future<Database> databaseInitializer;
  late final Database _database;

  FutureOr<void> Function(Database, int, int)? onUpgrade;
  FutureOr<void> Function(Database, int, int)? onDowngrade;
  FutureOr<void> Function(Database)? onOpen;
  Database get database => _database;

  Future<Database> _initializeDatabase(String databaseName, int version,
          List<String> databaseSchema) async =>
      openDatabase(
        join(await getDatabasesPath(), databaseName),
        onUpgrade: onUpgrade,
        onDowngrade: onDowngrade,
        onOpen: onOpen,
        onCreate: (database, version) async {
          for (String createTableQuery in databaseSchema) {
            await database.execute(createTableQuery);
          }
          return;
        },
        version: version,
      ).then((value) => _database = value);
}
