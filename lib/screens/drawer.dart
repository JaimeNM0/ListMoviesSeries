import 'package:flutter/material.dart';
import 'package:list_movies_series/utils/function.dart';

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
        color: colorPurple,
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
                title: Text(
                  "Home",
                  style: customTextStyle(),
                ),
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  Navigator.pushNamed(context, '/home');
                }),
            ListTile(
                title: Text(
                  "Profile Information",
                  style: customTextStyle(),
                ),
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  Navigator.pushNamed(context, '/seeker');
                }),
            ListTile(
                title: Text(
                  "Settings",
                  style: customTextStyle(),
                ),
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onTap: () {
                  print("Ir a Settings");
                }),
            ListTile(
                title: Text(
                  "Help / FAQ",
                  style: customTextStyle(),
                ),
                leading: const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                onTap: () {
                  print("Ir a Help / FAQ");
                }),
            ListTile(
                title: Text(
                  "Logout",
                  style: customTextStyle(),
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
