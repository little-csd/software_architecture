import 'package:sqflite/sqflite.dart';
import 'package:tickets/proto/passenger.pb.dart';

class DBServer {
  Database db;
  static const _tablePassenger = 'passenger';
  static const _tableOrder = 'order';
  static const _columnName = 'name';
  static const _columnIDCard = 'idCard';
  // TODO: 订单存储到数据库
  final _columnMap = Map()
    ..[_tablePassenger] = [_columnName, _columnIDCard]
    ..[_tableOrder] = [];

  Future<void> init() async {
    print('DBServer: Database init');
    if (db != null) return;
    db = await getDatabasesPath().then((value) {
      var path = '$value/user.db';
      print('DBServer: db path = $path');
      return openDatabase(path, version: 1, onCreate: (db, version) async {
        print('DBServer: Database onCreate');
        if (await _isTableExist(_tablePassenger, db)) {
          print('DBServer: table $_tablePassenger exist');
        } else {
          await _createTable(_tablePassenger, db);
          print('DBServer: create table success');
        }
      });
    });
  }

  _isTableExist(String tableName, Database db) async {
    print('DBServer: isTableExist');
    var sql =
        "SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$tableName'";
    var res = await db.rawQuery(sql);
    var returnRes = res != null && res.length > 0;
    return returnRes;
  }

  _createTable(String tableName, Database db) async {
    print('DBServer: createTable');
    var sql =
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT, $_columnIDCard TEXT)';
    await db.execute(sql);
  }

  Future<List<Passenger>> getPassengers() async {
    final result =
        await db.query(_tablePassenger, columns: [_columnName, _columnIDCard]);
    List<Passenger> data = List();
    for (var res in result) {
      Passenger passenger = Passenger();
      passenger.name = res[_columnName];
      passenger.idCard = res[_columnIDCard];
      data.add(passenger);
    }
    print('DBServer: query passengers, data length = ${data.length}');
    return data;
  }

  void addPassenger(Passenger data) async {
    int res = await db.insert(
        _tablePassenger, {_columnName: data.name, _columnIDCard: data.idCard});
    print('DBServer: add passenger result: $res');
  }
}

final db = DBServer();
