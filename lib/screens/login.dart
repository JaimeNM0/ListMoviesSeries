import 'package:flutter/material.dart';


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
            CircleAvatar(
                backgroundImage: AssetImage('assets/background.png'),
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
                )),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(
                  color: Colors.white), // Cambia el color del texto ingresado
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(
                  color: Colors.white), // Cambia el color del texto ingresado
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Text('Recordar contraseña'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('¿Se Olvidó de la Contraseña?'),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de inicio de sesión
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón de inicio de sesión con Google
              },
              child: Text('Iniciar sesión con Google'),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                // Acción al presionar el texto de registro
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
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
            Text('Página de registro'),
          ],
        ),
      ),
    );
  }
}
