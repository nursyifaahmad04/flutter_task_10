import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_syifa');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY,NamaPelanggan VARCHAR(30),alamat Text,telepon VARCHAR(15), email VARCHAR(30));";
    await database.execute(sql);
  }

  Future<void> _createDatabaseBarang(Database database, int version) async {
    String sql =
        "CREATE TABLE barang (id INTEGER PRIMARY KEY,KodeBarang Text,NamaBarang Text,harga Text,stock Text);";
    await database.execute(sql);
  }
}
