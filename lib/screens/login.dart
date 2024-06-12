import 'package:flutter/material.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/register.dart';
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';
import 'package:list_movies_series/utils/fuction.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
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
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 60,
                      child: Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 218, 216, 216),
                            width: 4.0,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 400.0,
                    margin: EdgeInsets.only(bottom: 5.0),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Correo electrónico',
                              labelStyle: customTextStyle(fontSize: 15.0),
                            ),
                            style: customTextStyle(fontSize: 15.0),
                          ),
                        ),
                        Container(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: customTextStyle(fontSize: 15.0),
                            ),
                            style: customTextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, bottom: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '¿Se Olvidó de la Contraseña?',
                            style: customTextStyle(color: Color.fromARGB(250, 104, 58, 183), fontSize: 15.0),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    checkColor: Colors
                                        .white, // Color del check cuando está activo
                                    activeColor: isChecked
                                        ? Colors.purple
                                        : Colors
                                            .transparent, // Color del fondo del checkbox cuando está activo o transparente cuando está desactivado
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Recordar contraseña',
                                    style: customTextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('Iniciar sesión'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Iniciar sesión con Google'),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 60), // Margen solo hacia abajo
                      child: Text('Registrarse'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
