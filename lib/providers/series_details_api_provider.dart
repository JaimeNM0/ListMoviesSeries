import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_movies_series/models/series_details_api_models.dart';
import 'dart:convert';

class SeriesDetailsApiProvider extends ChangeNotifier {
  //String search;
  String url = 'https://www.episodate.com/api/show-details?q=';
  List<SeriesDetailsApi>? listadoSeries = [];

  SeriesDetailsApiProvider();

  Future<List<SeriesDetailsApi>?> getListaSeries(String? search) async {
    url = url + search!;
    
    listadoSeries!.clear();

    Uri miUrl = Uri.parse(url);
    final respuesta = await http.get(miUrl);

    final Map<String, dynamic> mapaSeries = jsonDecode(respuesta.body);
    final List<dynamic> seriesData = mapaSeries['tv_shows'];

    for (var seriesJson in seriesData) {
      final series = SeriesDetailsApi.fromJson(seriesJson);
      listadoSeries?.add(series);
    }

    notifyListeners();
    return listadoSeries;
  }
}
