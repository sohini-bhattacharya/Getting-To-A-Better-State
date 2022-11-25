import 'package:flutter/material.dart';
import 'package:dbms/database_helper.dart';
class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();

}

class _MyRegisterState extends State<MyRegister> {
  final dbHelper = DatabaseHelper.instance;

  void instantiate() async{
    // dbHelper.delimiter();
    await dbHelper.ageTrigger();
  }
  void _insert(name,email,password,address,aadhar,birthdate) async {
    // row to insert
    dbHelper.table='r';
    dbHelper.databaseName='test';

    // Map<String, dynamic> row = {
    //   DatabaseHelper.columnName: name,
    //   DatabaseHelper.Username:username,
    //   DatabaseHelper.Password:password,
    // };

    // ID INTEGER PRIMARY KEY AUTOINCREMENT,
    // NAME TEXT NOT NULL,
    // EMAIL Text NOT NULL UNIQUE,
    // PASSWORD Text NOT NULL,
    // ADDRESS Text NOT NULL,
    // AADHAR INTEGER NOT NULL UNIQUE,
    // BIRTHDATE DATE NOT NULL,
    // AGE INTEGER

    final id = await dbHelper.insert(name,email,password,address,aadhar,birthdate);
    print('inserted row id: $id');
  }
  void _queryAll() async {
    var e = await dbHelper.queryRows(email);
    print(e);
  }
  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);

    print('deleted $rowsDeleted row(s): row $id');
  }
  
  String name = "";
  String email = "";
  String address = "";
  String password = "";
  String aadhar = "";
  String birthdate = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: nameController,
                            onChanged: (v) => setState(() => name=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: emailController,
                            onChanged: (v) => setState(() => email=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Address",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: addressController,
                            onChanged: (v) => setState(() => address=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Birthdate",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: birthdateController,
                            onChanged: (v) => setState(() => birthdate=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Aadhar",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: aadharController,
                            onChanged: (v) => setState(() => aadhar=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            controller: passwordController,
                            onChanged: (v) => setState(() => password=v),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      instantiate();
                                      _insert(name,email,password,address,aadhar,birthdate);
                                      //_delete(1);
                                      //_delete(2);
                                      //_delete(3);

                                      _queryAll();

                                      final snackBar = SnackBar(
                                        content: const Text('Success'),);
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      Navigator.pushNamed(context, 'login');
                                    },

                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
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