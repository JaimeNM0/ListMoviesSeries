import 'package:flutter/material.dart';
import 'package:list_movies_series/screens/home.dart';
import 'package:list_movies_series/screens/seeker.dart';
//import 'package:list_movies_series/main.dart';

class CustomDrawer extends StatelessWidget {
  static const Map<String, String> invitado = {
    'nick': 'Invitado',
    'nombre': 'Invitado',
    'correo': 'invitado@gmail.com',
  };
  final Map<String, String> usuario;

  CustomDrawer({Key? key, Map<String, String>? usuario})
      : usuario = (usuario != null && usuario.isNotEmpty) ? usuario : invitado,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: const Color(0xFFC427BB),
        color: const Color.fromRGBO(76, 32, 96, 1),
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: CircleAvatar(
                  //backgroundImage: AssetImage('assets/images/LogoMini.png'),
                  child: Image.asset(
                    'assets/images/LogoMini.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              accountName: Text(usuario["nick"]!),
              accountEmail: Text(usuario["correo"]!),
            ),
            ListTile(
                title: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                }),
            ListTile(
                title: const Text(
                  "Profile Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Seeker()),
                  );
                }),
            ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onTap: () {
                  print("Ir a Settings");
                }),
            ListTile(
                title: const Text(
                  "Help / FAQ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                onTap: () {
                  print("Ir a Help / FAQ");
                }),
            ListTile(
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () {
                  print("Hacer Logout");
                }),
          ],
        ),
      ),
    );
  } //backgroundColor: const Color(0xFFC427BB),

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
