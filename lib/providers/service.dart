import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService extends ChangeNotifier{

  // ignore: non_constant_identifier_names
  List<Product> lista_productos = [];
  bool isLoading = true;

  // ignore: non_constant_identifier_names
  ProductsService() {
    //this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    final url = Uri.parse("https://login-app-21-default-rtdb.firebaseio.com/productos.json");
    final resp = await http.get( url );

    final List<dynamic> productosMap = json.decode( resp.body );

    lista_productos = productosMap.map((item) {

      return Product.fromMap(item);
    }).toList();

    return lista_productos;
  }



}