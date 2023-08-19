import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:psugo/augmentation/dialog.dart';
import 'package:psugo/page/login.dart';
import 'package:psugo/page/model/user_model.dart';

class Hcar extends StatefulWidget {
  final String? choosevehicle;
  const Hcar({Key? key, required this.choosevehicle}) : super(key: key);

  @override
  State<Hcar> createState() => _HcarState();
}

class _HcarState extends State<Hcar> {
  String? vehicle;
  String? fullname, email, password, phone, faculty, bank;
  String choosevehicle = 'have car';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  child: Image(
                    image: AssetImage('images/psugo.png'),
                    width: 240,
                  ),
                ),
                Container(
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          fullname = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'Full name',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          email = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'example@gmail.com',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      obscureText: true,
                                      onChanged: (value) =>
                                          password = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          phone = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'Phone',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          faculty = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'Faculty',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextFormField(
                                      onChanged: (value) => bank = value.trim(),
                                      decoration: InputDecoration(
                                          hintText: 'Bank account',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)))),
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
                )
              ]),
            ),
            backgroundColor: Color.fromARGB(255, 58, 164, 245)));
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

  Center buttonRegister(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if ((fullname?.isEmpty ?? true) ||
              (email?.isEmpty ?? true) ||
              (password?.isEmpty ?? true) ||
              (phone?.isEmpty ?? true) ||
              (faculty?.isEmpty ?? true) ||
              (vehicle?.isEmpty ?? true) ||
              (bank?.isEmpty ?? true)) {
            print('have space.');
            normalDialog(context, 'Have Space.', 'Please Fill');
          } else {
            createAccountandInsertInformation(context);
            //_create();
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

  Future<void> createAccountandInsertInformation(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      if (userCredential.user != null) {
        User user = userCredential.user!;

        await user.updateDisplayName(fullname);
        print('Update profile success and uid = ${user.uid}');

        UserModel model = UserModel(
          uid: user.uid,
          choosevehicle: choosevehicle,
          fullname: fullname!,
          email: email!,
          password: password!,
          phone: phone!,
          faculty: faculty!,
          vehicle: '',
          bank: '',
        );

        Map<String, dynamic> data = model.toMap();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(data);

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
                      context, '/homenavi_h', (route) => false);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Handle the case where user is null
        print('User is null after createUserWithEmailAndPassword');
      }
    } catch (error) {
      print('FirebaseAuthException: $error');
      normalDialog(context, 'Error', error.toString());
    }

    ;
  }
}
