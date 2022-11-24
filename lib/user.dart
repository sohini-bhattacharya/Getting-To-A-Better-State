import 'package:flutter/material.dart';

import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';



class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  // Mysql db= new Mysql();
  String premium='';
  // void _changedelimiter() {
  //   db.getConnection().then((conn) {
  //     String sql = "delimiter #";
  //     conn.query(sql);
  //     conn.close();
  //   });
  // }
  // void _createfunction() {
  //   db.getConnection().then((conn) {
  //   String sql = "CREATE FUNCTION Premium ( age INT, gender varchar(2)) returns int deterministic begin declare premium int;if (age<20 and gender='M') then set premium=26; elseif (age<20 and gender='F') then set premium=20; elseif(age>=20 and age<40 and gender='M') then set premium=137; elseif(age>=20 and age<40 and gender='F') then set premium=107; elseif(age>=40 and gender='M') then set premium=244; else set premium=173; end if; return premium; end;#";
  //     conn.query(sql);
  //     conn.close();
  //   });
  // }
  // void _PredictPremium(int age,String gender) {
  //   db.getConnection().then((conn) {
  //     String a=age.toString();
  //     String sql = 'Select Premium( '+a+' '+gender+')';
  //     print(sql);
  //     conn.query(sql).then((results) {
  //       premium=results.toString();
  //     });
  //     conn.close();
  //   });
  // }
  void _test() async {
    var databasesPath = await getDatabasesPath();
    print(databasesPath);
    String path = databasesPath+ 'demo.db';

// Delete the database
    await deleteDatabase(path);

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'delimiter #');
        });

// Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });

// Update some record
    int? count = await database.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');

// Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);
    //assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
    count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
    assert(count == 2);

// Delete a record
    count = await database
        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);

// Close the database
    await database.close();}






  TextEditingController premium_Controller = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 50, top: 160),
              child: Text(
                'Predict your ',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50, top: 220),
              child: Text(
                'Premium ',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Age",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(),

                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Gender",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(),

                            controller: premium_Controller..text=premium,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //_changedelimiter();
                                  //_createfunction();
                                  //_PredictPremium(23,'M');
                                  _test();
                                  setState(() => premium='10');
                                  // Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Predict Premium',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'apply');
                                  },
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}