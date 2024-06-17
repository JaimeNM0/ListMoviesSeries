import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBar({Key? key, String? title})
      : title = (title != null && title.isNotEmpty) ? title : 'Guest',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset(
              'assets/images/LogoMini.png',
              width: 500,
              height: 500,
            ),
            onPressed: () {
              print('Esta en opciones');
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: Row(
            children: [
              Text(title),
              const SizedBox(width: 10),
              const Icon(Icons.person),
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

class CustomAppBarDetails extends StatelessWidget implements PreferredSizeWidget {
  String title;

  CustomAppBarDetails({Key? key, String? title})
      : title = (title != null && title.isNotEmpty) ? title : 'Guest',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: Row(
            children: [
              Text(title),
              const SizedBox(width: 10),
              const Icon(Icons.person),
            ],
          ),
          /*new Icon(Icons.merge_type),*/
          onPressed: () => print('Estas en perfil'),
        ),
      ],
      backgroundColor: const Color(0xFFC427BB),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
