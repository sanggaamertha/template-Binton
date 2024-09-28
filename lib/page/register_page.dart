import 'package:baca_mongo/menu/nav_bar/navigation_menu.dart';
import 'package:baca_mongo/page/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

import './signin_page.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 12, 15),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _email,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  cursorColor: const Color.fromARGB(225, 248, 86, 88),
                  controller: _password,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(225, 248, 86, 88),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: register,
                  // () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomePage()));

                  // },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color.fromARGB(225, 248, 86, 88),
                    ),
                    height: 60,
                    width: 600,
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a User?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn2()));
                      },
                      child: const Text(
                        'SignIn',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    String email = _email.text;
    String password = _password.text;

    context.read<LoginRealm>().register(email, password).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationMenu()));
    }).catchError((e) {
      print(e);
    });
  }
}
