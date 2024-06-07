// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/register.dart';
import 'package:list_movies_series/google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
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
                    margin: EdgeInsets.only(bottom: 100),
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        // Ruta de la imagen de logo en el directorio de assets
                        radius: 70,
                        child: Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 218, 216, 216),
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.circular(
                                70), // Change the radius value to whatever you desire
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
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          style: TextStyle(
                              color: Colors
                                  .white), // Cambia el color del texto ingresado
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(bottom: 50),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          style: TextStyle(
                              color: Colors
                                  .white), // Cambia el color del texto ingresado
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
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
                    // Acción al presionar el texto de registro
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
