import 'dart:async';

import 'package:app/utils/encrypt_code.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static AppDatabase _singleton;
  Database _db;
  Database _securityDb;

  factory AppDatabase() {
    if (_singleton == null) {
      _singleton = AppDatabase._();
    }
    return _singleton;
  }

  AppDatabase._();

  Future<Database> _setupDataBase(String dbName, bool encrypted) async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    var dbPath = '${appDocDirectory.path}/$dbName.db';
    var dbFactory = databaseFactoryIo;

    var codec;
    if (encrypted) {
      codec = getEncryptSembastCodec(password: 'DYf2eLYEdVTuvGgX');
    }

    return await dbFactory.openDatabase(dbPath, codec: codec);
  }

  Future<Database> get database async {
    if (_db == null) {
      _db = await _setupDataBase('sicom', false);
    }
    return _db;
  }

  Future<Database> get securityDatabase async {
    if (_securityDb == null) {
      _securityDb = await _setupDataBase('sicoms', true);
    }
    return _securityDb;
  }
}
