// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      // Handle error appropriately in your app
    }
  }

  Future<void> _loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print(e);
      // Handle error appropriately in your app
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(252, 92, 92, 1),
              Color.fromRGBO(252, 68, 172, 1),
              Color.fromRGBO(228, 84, 244, 1),
              Color.fromRGBO(156, 84, 244, 1),
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        bottom:
                            50), // Cambiar el margen para mover el logo más abajo
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 70,
                        child: Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 218, 216, 216),
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ))),
                Container(
                  width: 400.0,
                  margin: EdgeInsets.only(bottom: 5.0),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 50, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 80, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '¿Se Olvidó de la Contraseña?',
                                style: TextStyle(
                                    color: Color.fromARGB(250, 104, 58, 183),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Row(children: [
                          Checkbox(
                            value: false,
                            focusColor: Colors.white,
                            checkColor: Colors.white,
                            activeColor: Colors.white,
                            onChanged: (value) {},
                          ),
                          Text(
                            'Recordar contraseña',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ]),
                      ],
                    )),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => _loginWithEmailAndPassword(context),
                  child: Text('Iniciar sesión'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => _loginWithGoogle(context),
                  child: Text('Iniciar sesión con Google'),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'Registrarse',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}


