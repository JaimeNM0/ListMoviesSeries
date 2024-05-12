import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  MyAppBar({Key? key, String? title})
      : title = (title != null && title.isNotEmpty) ? title : 'Invitado',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset(
              'assets/images/LogoMini.png',
              width: 500, // Ancho deseado de la imagen
              height: 500, // Alto deseado de la imagen
            ),
            onPressed: () => print('Esta en opciones'),
          );
        },
      ),
      //title: Text(title),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: Row(
            children: [
              Text(title),
              new Icon(Icons.merge_type),
            ],
          ),
          /*new Icon(Icons.merge_type),*/
          onPressed: () => print('Estas en perfil'),
        ),
      ],
      backgroundColor: const Color(0xFFC427BB),
    );
  } //backgroundColor: const Color(0xFFC427BB),

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/*class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  String title = 'N.usuario';

  MyHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/

class MyAppBarDetails extends StatelessWidget {
  final String title;

  const MyAppBarDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Acción al presionar el ícono de configuración
          },
        ),
      ],
    );
  }
}
