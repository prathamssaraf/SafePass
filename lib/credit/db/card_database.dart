import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:safepass/credit/model/card.dart';

class CreditDatabase {
  static final CreditDatabase instance = CreditDatabase._init();

  static Database? _database;

  CreditDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('credits.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableCredit ( 
  ${CreditFields.id} $idType, 
  ${CreditFields.cvv} $textType,
  ${CreditFields.name} $textType,
  ${CreditFields.number} $integerType,
  ${CreditFields.cardnumber} $textType,
  ${CreditFields.expiry} $textType,
  ${CreditFields.time} $textType
  )
''');
  }

  Future<Credit> create(Credit credit) async {
    final db = await instance.database;

    // final json = credit.toJson();
    // final columns =
    //     '${CreditFields.title}, ${CreditFields.description}, ${CreditFields.time}';
    // final values =
    //     '${json[CreditFields.title]}, ${json[CreditFields.description]}, ${json[CreditFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableCredit, credit.toJson());
    return credit.copy(id: id);
  }

  Future<Credit> readCredit(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCredit,
      columns: CreditFields.values,
      where: '${CreditFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Credit.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Credit>> readAllCredits() async {
    final db = await instance.database;

    final orderBy = '${CreditFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableCredit ORDER BY $orderBy');

    final result = await db.query(tableCredit, orderBy: orderBy);

    return result.map((json) => Credit.fromJson(json)).toList();
  }

  Future<int> update(Credit credit) async {
    final db = await instance.database;

    return db.update(
      tableCredit,
      credit.toJson(),
      where: '${CreditFields.id} = ?',
      whereArgs: [credit.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCredit,
      where: '${CreditFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
