import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.imagen,
    required this.nombre,
    required this.precio,
  });
  String nombre;
  String imagen;
  String id;
  double precio;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<dynamic, dynamic> json) => Product(
        nombre: json["nombre"],
        precio: double.parse(json["precio"].toString()),
        imagen: json["imagen"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "precio": precio,
        "imagen": precio,
        "id": id,
      };
}
