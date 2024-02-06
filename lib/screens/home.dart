//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_movies_series/models/product.dart';
import 'package:list_movies_series/models/series_profile_models.dart';
import 'package:list_movies_series/providers/series_profile_provider.dart';
import 'package:list_movies_series/providers/service.dart';
import 'package:provider/provider.dart';


/*class hola extends StatelessWidget {
  static const String _title = 'Listado Series';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Productos(context),
    );
  }
}*/

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final listSeriesProfile = Provider.of<SeriesProfileProvider>(context, listen: false);
    return FutureBuilder<List<Series>?>(
      future: listSeriesProfile.getListaSeries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              print(snapshot.data!.length);
              print(snapshot.data![0]);
              return Text(snapshot.data![0].name);
            }
            return Text("Error no se ha encontrado nada.");
          }
    });
  }
}//Expanded para que no de error al tener más tamaño.

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _list_productos = Provider.of<ProductService>(context, listen: false);

    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _list_productos.loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              print(snapshot.data!.length);
              print(snapshot.data![0].nombre);
              return Text("Hola productos");
            }
            return Text("Hola productos 2");
          }
        }
      )
    );
  }
}


/*child: ListView.builder(
          itemCount: titulos.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              color: Color.fromARGB(255, 67, 178, 182),
              child: Column(
                children: [
                  TextButton(onPressed: (){/*Navigator.pushNamed(context, '/ocio_descripcion');*/
                  /*Navigator.push(context,MaterialPageRoute(builder: (context) => ocio_descripcion()),);*/},
                  child: Container(
                    child: ListTile(
                      title: FormatoTexto(titulos[index], 20),/*Text(titulos[index]),*/
                      horizontalTitleGap: 20,
                      leading: Image.asset('assets/'+imagen),
                      subtitle: Column(
                        children: [
                          FormatoTexto("Precio: "+precios[index]+"€", 16),/*Text("Precio: "+precios[index]),*/
                          FormatoTexto("Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. ", 14),
                          /*Text("Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. Esto es un subtitulo. "),*/
                        ],
                      ),
                      /*onTap: () {}*/
                    ),
                  ),
                  ),
                ],
              ),
            );
          }),*/
