import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 100.0, right: 100.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nick',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Apellidos',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Género',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Teléfono',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Confirmar Contraseña',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de registrarse
              },
              child: Text('Registrarse'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
