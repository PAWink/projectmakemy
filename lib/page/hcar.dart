import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/augmentation/dialog.dart';
import 'package:psugo/page/login.dart';

class Hcar extends StatefulWidget {
  const Hcar({Key? key}) : super(key: key);

  @override
  State<Hcar> createState() => _HcarState();
}

class _HcarState extends State<Hcar> {
  String? vehicle;
  String? fullname, email, password, phone, factuly, bank;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        topLogo(),
        underInformation(context),
      ])),
    );
  }

  Flexible underInformation(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(30), //ย่อหน้าใช้ padding
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Register sharing car',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full name',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => fullname = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'Full name',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => email = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => password = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Phone',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => phone = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'Phone',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Faculty',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => factuly = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'Faculty',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          child: Text(
                            'Vehicle',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        vehicleRadio(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Bank account',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            onChanged: (value) => bank = value.trim(),
                            decoration: InputDecoration(
                                hintText: 'Bank account',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buttonRegister(context)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column vehicleRadio() {
    return Column(
      children: [
        RadioListTile(
          title: Text(
            'Car',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Car',
          groupValue: vehicle,
          onChanged: (value) {
            setState(() {
              vehicle = value;
            });
          },
          activeColor: Colors.white,
          selectedTileColor: Colors.white,
        ),
        RadioListTile(
          title: Text(
            'Mortorcycle',
            style: TextStyle(color: Colors.white),
          ),
          value: 'Mortorcycle',
          groupValue: vehicle,
          onChanged: (value) {
            setState(() {
              vehicle = value;
            });
          },
          activeColor: Colors.white,
          selectedTileColor: Colors.white,
        ),
      ],
    );
  }

  Flexible topLogo() {
    return Flexible(
      flex: 1,
      child: Container(
        child: Image(
          image: AssetImage('images/psugo.png'),
          width: 240,
        ),
      ),
    );
  }

  Center buttonRegister(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if ((fullname?.isEmpty ?? true) ||
              (email?.isEmpty ?? true) ||
              (password?.isEmpty ?? true) ||
              (phone?.isEmpty ?? true) ||
              (factuly?.isEmpty ?? true) ||
              (vehicle?.isEmpty ?? true) ||
              (bank?.isEmpty ?? true)) {
            print('have space.');
            normalDialog(context, 'Have Space.', 'Please Fill');
          } else {
            createAccountandInsertInformation();
            _create();
          }
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.greenAccent,
          minimumSize: Size(80, 45),
        ),
      ),
    );
  }

  Future<Null> createAccountandInsertInformation() async {
    await Firebase.initializeApp().then((value) async {
      print('## Firebase initial Success');
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        print('Create Account Success');
        showDialog(
            context: context,
            builder: (context) => SimpleDialog(
                  title: ListTile(
                    leading: Icon(
                      Icons.ac_unit,
                      color: Colors.green,
                    ),
                    title: Text('Success'),
                    subtitle: Text('Create Account success'),
                  ),
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/helloHcar', (route) => false);
                        },
                        child: Text('OK'))
                  ],
                ));
      } catch (error) {
        print('FirebaseAuthException: error.toString');
        normalDialog(context, 'Error', error.toString());
      }
    });
  }

  Future _create() async {
    final carCollection = FirebaseFirestore.instance.collection('cars');

    final carDoc = carCollection.doc();

    await carDoc.set(
      {
        'fullname': fullname,
        'email': email,
        'password': password,
        'phone': phone,
        'faculty': factuly,
        'vehicle': vehicle,
        'bank': bank,
      },
    );
  }
}
