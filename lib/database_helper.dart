import 'package:path/path.dart';
import 'dart:developer' as developer;
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

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

    await db.execute('''
          CREATE TABLE a (
            P_ID INTEGER PRIMARY KEY,
            APPROVED TEXT,
            FOREIGN KEY (P_ID) REFERENCES l(P_ID)
          )
          ''');

    // await makeManager();

    print("done1");

  }



  Future joinSpecificFunction(id) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''
    SELECT * FROM r INNER JOIN l ON r.EMAIL = l.EMAIL WHERE M_ID="${id}"
    ''');

    // SELECT table1.column1,table1.column2,table2.column1,....
    // FROM table1
    // INNER JOIN table2
    // ON table1.matching_column = table2.matching_column;

    print("join is here");
    print(result);
    print(result[0]);
    print(result[1]);
  }

  Future beginTransaction() async {
    Database db = await instance.database;
    await db.execute('''
          BEGIN TRANSACTION
          ''');
  }

  Future approvedOrNot(st) async {

    Database db = await instance.database;
    if(st=true) {
      await db.execute('''
          COMMIT
          ''');
    }
    else {
      await db.execute('''
          ROLLBACK
          ''');
    }

  }

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
    DELIMITER //
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

  Future managerTrigger() async {
    Database db = await instance.database;

    await db.execute('''
    CREATE TRIGGER MS1
    AFTER INSERT ON l FOR EACH ROW
    BEGIN
    UPDATE l
    SET M_ID = CASE GENDER WHEN "male" THEN "em1"
    WHEN "female" THEN "em2"
    ELSE "em3"
    END;
    END
    ''');
  }


  Future estimateFunction() async {
    Database db = await instance.database;
    await db.rawQuery('''
    CREATE FUNCTION ESTIMATE(AGE INT, GENDER VARCHAR(20))
    RETURNS INT DETERMINISTIC
    BEGIN
    DECLARE RESULT INT;
    IF AGE<20 AND GENDER='male' THEN
    SET RESULT = 68;
    ELSEIF AGE<20 AND GENDER='female' THEN
    SET RESULT = 55;
    ELSEIF AGE>=20 AND AGE<40 AND GENDER='male' THEN
    SET RESULT = 137;
    ELSEIF AGE>=20 AND AGE<40 AND GENDER='female' THEN
    SET RESULT = 107;
    ELSEIF AGE>=40 AND GENDER='male' THEN
    SET RESULT = 244;
    ELSE
    SET RESULT = 173;
    END IF;
    RETURN RESULT;
    END
    ''');
  }
  Future estimateTrigger() async {
    Database db = await instance.database;

    await db.execute('''
    CREATE TRIGGER EST
    AFTER INSERT ON l FOR EACH ROW
    BEGIN
    UPDATE l
    SET M_ID = CASE GENDER WHEN "male" THEN "em1"
    WHEN "female" THEN "em2"
    ELSE "em3"
    END;
    END
    ''');
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

      DateTime now = DateTime.now();
      String formattedTime = DateFormat("yyyy-MM-dd").format(now);

      await db.execute('''
          INSERT INTO l (EMAIL,M_ID,GENDER,AGE,AMT,EDIT_TIME) values("${username}","${m_id}","${gender}","${age}","${amt}","${formattedTime}")''');
    }




  Future estimatePremium(gender,age) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''
    SELECT ESTIMATE(${age},"${gender}")
    ''');
    print(result);
    print(result[0]);

  }

  // P_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  // EMAIL TEXT,
  //     M_ID INTEGER,
  // GENDER TEXT NOT NULL,
  //     AGE INTEGER NOT NULL,
  // AMT INTEGER NOT NULL,
  //     EDIT_TIME DATETIME NOT NULL,
  // FOREIGN KEY (EMAIL) REFERENCES r(EMAIL),
  // FOREIGN KEY (M_ID) REFERENCES m(M_ID)




  Future<int> predictPremium(gender,age) async{
    int result = 0;
    if(age<20){
      if(gender=="male"){
        result=68;
      }
      else{
        result=55;
      }
    }
    else if(age>=20&&age<40){
      if(gender=="male"){
        result=137;
      }
      else{
        result=107;
      }

    }
    else if(age>=40){
      if(gender=="male"){
        result=244;
      }

    }
    else{
      result=173;
    }
    return result;
  }




  Future joinFunction() async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''
   SELECT * FROM r INNER JOIN l ON r.EMAIL = l.EMAIL
    ''');

    // SELECT table1.column1,table1.column2,table2.column1,....
    // FROM table1
    // INNER JOIN table2
    // ON table1.matching_column = table2.matching_column;

    print("join is here");
    print(result);
    print(result[0]);
    print(result[1]);
  }

  Future age_Trigger() async {
    print("hello");
    Database db = await instance.database;

    DateTime now = DateTime.now();
    String formattedTime = DateFormat("yyyy").format(now);

    // var year = await db.rawQuery('''SELECT AGE FROM r''');
    await db.rawQuery('''
    CREATE TRIGGER ABC
    AFTER INSERT ON r FOR EACH ROW
    BEGIN
    UPDATE r SET AGE = );
    END
    ''');
  }

  Future assignManager(gender) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''
    SELECT GENERATE("${gender}")"
    ''');
    print(result);
    print(result[0]);

  }



  Future generateManagerFunction() async {
    Database db = await instance.database;
    await db.rawQuery('''
    CREATE FUNCTION GENERATE(GENDER VARCHAR(20))
    RETURNS VARCHAR(20)
    BEGIN
    DECLARE GM VARCHAR(20);
    IF GENDER="female" THEN
    SET GM = 'em1';
    ELSEIF GENDER="male" THEN
    SET GM = 'em2';
    ELSE
    SET GM = 'em3';
    END IF;
    RETURN GM;
    END
    ''');

  }



  Future editDetails(username,gender,age,address,worksAt) async {
      Database db = await instance.database;
      await db.execute('''
    UPDATE r SET WORKS="${worksAt}", ADDRESS="${address}", GENDER="${gender}", AGE="${age}" WHERE EMAIL="${username}"''');

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



    Future insert(String name, String email, String password, String address,
        String aadhar, String birthdate) async {
      Database db = await instance.database;
      // return await db.insert(table, {'name': Name, 'Username': Username,'Password':password});
      await db.execute('''
          INSERT INTO $table(NAME,EMAIL,PASSWORD,ADDRESS,AADHAR,BIRTHDATE) values("${name}","${email}","${password}","${address}","${aadhar}","${birthdate}")''');
    }


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
      // print(result);
      // print(result[0]);
      // print(result[0]["PASSWORD"]);

      return result[0]["PASSWORD"];
    }

    Future<int?> queryRows(t) async {
      Database db = await instance.database;
      List<Map> result = await db.query(t);

      result.forEach((row) => print(row));
    }

    //
    // Future<List> allPremiumDetails(id) async {
    //
    // }

  Future<List> joinForPremium(email) async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery('''
   SELECT * FROM l WHERE EMAIL = "${email}"
    ''');

    // SELECT table1.column1,table1.column2,table2.column1,....
    // FROM table1
    // INNER JOIN table2
    // ON table1.matching_column = table2.matching_column;
    List list = [];
    String a= "";
    for(int i=0;i<result.length;i++){
      print("this is list ${i}");
      a = "ID: " + result[i]["P_ID"].toString() + "    AMT: " + result[i]["AMT"].toString() + "    DATE: " + result[i]["EDIT_TIME"].toString();
      print(a);
      list.add(a);
      print(list);
    }
    print("join is here");
    print(result);
    print(result[0]);
    print(result[1]);

    return list;
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

      return list;
    }

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
