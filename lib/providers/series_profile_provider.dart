import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/series_profile_models.dart';

class SeriesProfileProvider extends ChangeNotifier {
  String url = "https://www.episodate.com/api/most-popular?page=1";
  List<Series>? listadoSeries = [];

  SeriesProfileProvider();

  Future<List<Series>?> getListaSeries() async {
    listadoSeries!.clear();

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
