import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/series_profile_models.dart';

class SeriesProfileProvider extends ChangeNotifier {
  String urlBasic = "https://www.episodate.com/api/most-popular?page=";

  SeriesProfileProvider();

  Future<List<Series>?> getListaSeries(String? page) async {
    List<Series>? listadoSeries = [];
    String url = urlBasic + page!;
    //listadoSeries!.clear();

    Uri miUrl = Uri.parse(url);
    final respuesta = await http.get(miUrl);

    final Map<String, dynamic> mapaSeries = jsonDecode(respuesta.body);
    final List<dynamic> seriesData = mapaSeries['tv_shows'];

    for (var seriesJson in seriesData) {
      final series = Series.fromJson(seriesJson);
      listadoSeries?.add(series);
    }

    notifyListeners();
    return listadoSeries;
  }
}
