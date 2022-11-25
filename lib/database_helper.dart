import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  var databaseName = "test.db";
  static final _databaseVersion = 1;

  var table = 'r';
  //
  // static final columnId = 'id';
  // static final columnName = 'name';
  // static final Username='Username';
  // static final Password='Password';

  // String name = "";
  // String email = "";
  // String address = "";
  // String password = "";
  // String aadhar = "";
  // String birthdate = "";
  // String age = "";
  //

  //static final columnMiles = 'miles';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async =>
      _database ??= await _initDatabase();


  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }


  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT NOT NULL,
            EMAIL TEXT NOT NULL UNIQUE,
            PASSWORD TEXT NOT NULL,
            ADDRESS TEXT NOT NULL,
            AADHAR INTEGER NOT NULL UNIQUE,
            BIRTHDATE DATE NOT NULL,
            AGE INTEGER
          )
          ''');
  }

  Future delimiter() async{
    Database db = await instance.database;
    await db.execute('''
    delimiter //
    ''');
  }

  Future ageTrigger() async {
    Database db = await instance.database;
    // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
    // await db.execute('''
    // CREATE TRIGGER AGE_BRACKET
    // BEFORE INSERT ON $table FOR EACH ROW BEGIN
    // SET NEW.AGE = YEAR(CURTIME())-YEAR(NEW.BIRTHDATE);
    // END;
    // ''');
    await db.execute('''
    CREATE TRIGGER AGE_BRACKET
    BEFORE INSERT ON $table FOR EACH ROW
    BEGIN
    SET NEW.AGE = TIMESTAMPDIFF(YEAR,NEW.BIRTHDATE,CURTIME());
    END
    ''');

  }

  // ID INTEGER PRIMARY KEY AUTOINCREMENT,
  // NAME TEXT NOT NULL,
  //     EMAIL Text NOT NULL UNIQUE,
  //     PASSWORD Text NOT NULL,
  // ADDRESS Text NOT NULL,
  //     AADHAR INTEGER NOT NULL UNIQUE,
  //     BIRTHDATE DATE NOT NULL

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future insert(String name,String email,String password,String address,String aadhar,String birthdate) async {
    Database db = await instance.database;
    // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
    await db.execute('''
          INSERT INTO $table(NAME,EMAIL,PASSWORD,ADDRESS,AADHAR,BIRTHDATE) values("${name}","${email}","${password}","${address}","${aadhar}","${birthdate}")''');

  }

  Future<String> checkLogin(email) async{
    Database db = await instance.database;
    // bool b = false;
    // Future<String> result = db.select('''SELECT PASSWORD FROM $table WHERE EMAIL="${email}"''');
    List<Map> result = await db.rawQuery('''SELECT PASSWORD FROM $table WHERE EMAIL="${email}"''');

    print(result);
    print(result[0]["PASSWORD"]);
    // print(password);
    // if (result[0]["PASSWORD"].toString()==password.toString()){
    //   b=true;
    // }
    // else{
    //   b=false;
    // }

    // print(b);
    // return(b);
    return result[0]["PASSWORD"];
  }
  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  // Future queryAllRows() async {
  //   Database db = await instance.database;
  //   await db.execute('''
  //         SELECT * FROM $table
  //         ''');
  // }

  // Queries rows based on the argument received
  Future<int?> queryRows(email) async {
    Database db = await instance.database;
    List<Map> result = await db.query(table);

    // print the results
    result.forEach((row) => print(row));
  }

  Future queryLogin(email) async {
    Database db = await instance.database;
    await db.execute('''
          SELECT * FROM $table WHERE EMAIL="$email"
          ''');
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // // column values will be used to update the row.
  // Future<int> update(Car car) async {
  //   Database db = await instance.database;
  //   int id = car.toMap()['id'];
  //   return await db.update(table, car.toMap(), where: '$columnId = ?', whereArgs: [id]);
  // }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future delete(int id) async {
    Database db = await instance.database;
    // return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);

    await db.execute('''
          SELECT * FROM $table WHERE id="$id"
          ''');
  }
}