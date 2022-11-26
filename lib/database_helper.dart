import 'package:path/path.dart';
import 'dart:developer' as developer;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  var databaseName = "test.db";
  static final _databaseVersion = 1;

  var table = 'r';

  //

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
          CREATE TABLE r (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT NOT NULL,
            EMAIL TEXT NOT NULL UNIQUE,
            PASSWORD TEXT NOT NULL,
            ADDRESS TEXT NOT NULL,
            AADHAR INTEGER NOT NULL UNIQUE,
            BIRTHDATE DATE NOT NULL,
            AGE INTEGER,
            GENDER TEXT,
            WORKS TEXT
          )
          ''');

    await db.execute('''
          CREATE TABLE m (
            M_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT NOT NULL,
            EMAIL TEXT NOT NULL UNIQUE,
            PASSWORD TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE l (
            P_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            EMAIL TEXT,
            M_ID INTEGER,
            GENDER TEXT NOT NULL,
            AGE INTEGER NOT NULL,
            AMT INTEGER NOT NULL,
            EDIT_TIME DATETIME NOT NULL,
            FOREIGN KEY (EMAIL) REFERENCES r(EMAIL),
            FOREIGN KEY (M_ID) REFERENCES m(M_ID)
          )
          ''');

    print("done1");


  }

  // create function premium(age int,gender varchar(2))returns int deterministic
  // -> begin
  // -> declare result int;
  // -> if age<20 and gender='M' then
  // -> set result=68;
  // -> elseif age<20 and gender='F' then
  // -> set result=55;
  // -> elseif age>=20 and age<40 and gender='M' then
  // -> set result=137;
  // -> elseif age>=20 and age<40 and gender='F' then
  // -> set result=107;
  // -> elseif age>=40 and gender='M' then
  // -> set result=244;
  // -> else
  // -> set result=173;
  // -> end if;
  // -> return result;
  // -> end//

  Future makeUser() async {
    Database db = await instance.database;
    await db.execute('''
          CREATE TABLE r (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT NOT NULL,
            EMAIL TEXT NOT NULL UNIQUE,
            PASSWORD TEXT NOT NULL,
            ADDRESS TEXT NOT NULL,
            AADHAR INTEGER NOT NULL UNIQUE,
            BIRTHDATE DATE NOT NULL,
            AGE INTEGER,
            GENDER TEXT,
            WORKS TEXT
          )
          ''');
  }

    Future makeLogTable() async {
      Database db = await instance.database;
      await db.execute('''
          CREATE TABLE l (
            P_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            EMAIL TEXT,
            M_ID INTEGER,
            AMT INTEGER,
            EDIT_TIME DATETIME NOT NULL,
            FOREIGN KEY (EMAIL) REFERENCES r(EMAIL)
            FOREIGN KEY (M_ID) REFERENCES m(M_ID)
          )
          ''');
    }
    // Future getAttributes() asy
    Future makeManager() async {
      Database db = await instance.database;

      print("done1");

      await insertManager("abc1", "em1", "hello1");
      await insertManager("abc2", "em2", "hello2");
      await insertManager("abc3", "em3", "hello3");

      print("done2");


    }


    Future delimiter() async {
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
      print("hello");
      await db.execute('''
    CREATE TRIGGER ABC1234567
    AFTER INSERT ON r FOR EACH ROW
    BEGIN
    UPDATE r SET AGE = select strftime('%Y','now');
    END
    ''');
    }
//
//     Future applyPremium() async {
//       Database db = await instance.database;
//       // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
//       // await db.execute('''
//       // CREATE TRIGGER AGE_BRACKET
//       // BEFORE INSERT ON $table FOR EACH ROW BEGIN
//       // SET NEW.AGE = YEAR(CURTIME())-YEAR(NEW.BIRTHDATE);
//       // END;
//       // ''');
//       await db.execute('''
//     CREATE PROCEDURE
//    UPDATE table_name
// SET column_name1= value1, column_name2= value2
// WHERE condition;
//     ''');
//     }

  Future logTableEntries(username, gender, age) async {
    Database db = await instance.database;

    await updateAge(username, age);
    await updateGender(username, gender);
  }

    Future insertPremium(username, m_id, gender, age, amt) async {
      Database db = await instance.database;

      // P_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      // EMAIL TEXT,
      // M_ID INTEGER,
      // GENDER TEXT NOT NULL,
      // AGE INTEGER NOT NULL,
      // AMT INTEGER NOT NULL,
      // EDIT_TIME DATETIME NOT NULL,
      // FOREIGN KEY (EMAIL) REFERENCES r(EMAIL)
      // FOREIGN KEY (M_ID) REFERENCES m(M_ID)
      await db.execute('''
          INSERT INTO l (EMAIL,M_ID,GENDER,AGE,AMT,EDIT_TIME) values("${username}","${m_id}","${gender}","${age}","${amt}","curtime()")''');
    }



  Future estimatePremium(username,gender,age) async {
    Database db = await instance.database;
    await db.execute('''
    ESTIMATE(${age} "''');

    // await updateAge(username, age);
    // await updateGender(username, gender);
    // await updateAddress(username, address);
    // await updateWorksAt(username, worksAt);
  }

  Future estimateFunction() async {
    Database db = await instance.database;
    await db.execute('''
    CREATE FUNCTION ESTIMATE(AGE INT,GENDER TEXT)
    RETURNS INT DETERMINISTIC
    BEGIN
    DECLARE EST INT;
    SET EST = ''');
  }

  // Future generateManager(gender) async {
  //   Database db = await instance.database;
  //   await db.execute('''
  //   CREATE FUNCTION GENERATE(GENDER TEXT)
  //   RETURNS TEXT
  //   BEGIN
  //   DECLARE GM TEXT;
  //   IF GENDER="female"''');
  //   // await updateAge(username, age);
  //   // await updateGender(username, gender);
  //   // await updateAddress(username, address);
  //   // await updateWorksAt(username, worksAt);
  // }
  //


  Future editDetails(username,gender,age,address,worksAt) async {
      Database db = await instance.database;
      await db.execute('''
    UPDATE r SET WORKS="${worksAt}", ADDRESS="${address}", GENDER="${gender}", AGE="${age}" WHERE EMAIL="${username}"''');
      // await updateAge(username, age);
      // await updateGender(username, gender);
      // await updateAddress(username, address);
      // await updateWorksAt(username, worksAt);
    }



  Future updateWorksAt(username, worksAt) async {
    Database db = await instance.database;

    await db.execute('''
    UPDATE r SET WORKS="${worksAt}" WHERE EMAIL="${username}"''');
  }

  Future updateAddress(username, address) async {
    Database db = await instance.database;

    await db.execute('''
    UPDATE r SET ADDRESS="${address}" WHERE EMAIL="${username}"''');
  }



  Future updateGender(username, gender) async {
      Database db = await instance.database;

      await db.execute('''
    UPDATE r SET GENDER="${gender}" WHERE EMAIL="${username}"''');
    }

    Future updateAge(username, age) async {
      Database db = await instance.database;

      await db.execute('''
    UPDATE r SET AGE="${age}" WHERE EMAIL="${username}"''');
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
    Future insert(String name, String email, String password, String address,
        String aadhar, String birthdate) async {
      Database db = await instance.database;
      // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
      await db.execute('''
          INSERT INTO $table(NAME,EMAIL,PASSWORD,ADDRESS,AADHAR,BIRTHDATE) values("${name}","${email}","${password}","${address}","${aadhar}","${birthdate}")''');
    }

    // M_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    // NAME TEXT NOT NULL,
    //     EMAIL TEXT NOT NULL UNIQUE,
    //     PASSWORD TEXT NOT NULL,


    Future insertManager(String name, String email, String password) async {
      Database db = await instance.database;
      // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
      await db.execute('''
          INSERT INTO m (NAME,EMAIL,PASSWORD) values("${name}","${email}","${password}")''');
    }


    Future<String> checkLogin(t, email) async {
      Database db = await instance.database;

      List<Map> result = await db.rawQuery(
          '''SELECT * FROM ${t} WHERE EMAIL="${email}"''');

      print("here with the result");
      print(result);
      print(result[0]);
      // print(result[0][0]);
      print(result[0]["PASSWORD"]);
      // print(password);
      // if (result[0]["PASSWORD"].toString()==password.toString()){
      //   b=true;
      // }
      // else{

      //   b=false;
      // }
      //
      // List<Map> list1 = [];


      // list1.add("ID :" + result[0]["ID"]);
      // list1.add("NAME :" + result[0]["NAME"]);
      // list1.add("EMAIL :" + result[0]["EMAIL"]);
      // list1.add("ADDRESS :" + result[0]["ADDRESS"]);
      // list1.add("AADHAR :" + result[0]["AADHAR"]);
      // list1.add("BIRTHDATE :" + result[0]["BIRTHDATE"]);
      // list1.add("AGE :" + result[0]["AGE"]);
      //
      // print("list");
      // print(list1);


      // print(b);
      // return(b);
      return result[0]["PASSWORD"];
    }

    Future<int?> queryRows(t) async {
      Database db = await instance.database;
      List<Map> result = await db.query(t);

      // print the results
      result.forEach((row) => print(row));
    }

    Future<List> getAttributes(t, email) async {
      Database db = await instance.database;
      print(email);
      List<Map> result = await db.rawQuery(
          '''SELECT * FROM ${t} WHERE EMAIL="${email}"''');

      var list = [
        "ID: " + result[0]["ID"].toString(),
        "NAME: " + result[0]["NAME"].toString(),
        "EMAIL: " + result[0]["EMAIL"].toString(),
        "ADDRESS: " + result[0]["ADDRESS"].toString(),
        "AADHAR: " + result[0]["AADHAR"].toString(),
        "BIRTHDATE: " + result[0]["BIRTHDATE"].toString(),
        "AGE: " + result[0]["AGE"].toString(),
        "WORKS AT: " + result[0]["WORKS"].toString(),
        "GENDER: " + result[0]["GENDER"].toString()
      ];

      print(list);
      // print(result.length);
      // developer.log(result.toString());
      return list;
      // await db.execute('''SELECT * FROM $table WHERE EMAIL="$email"''');
    }

    // All of the methods (insert, query, update, delete) can also be done using
    // raw SQL commands. This method uses a raw query to give the row count.
    Future<int?> queryRowCount() async {
      Database db = await instance.database;
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $table'));
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
