import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_movies_series/models/series_details_api_models.dart';
import 'dart:convert';

class SeriesDetailsApiProvider extends ChangeNotifier {
  String urlBasic = 'https://www.episodate.com/api/show-details?q=';//48879';

  SeriesDetailsApiProvider();

  Future<SeriesDetailsApi> getDetailsSeries(String? search) async {
    String url = urlBasic + search!;

    Uri miUrl = Uri.parse(url);
    final respuesta = await http.get(miUrl);

    final Map<String, dynamic> mapaSeries = jsonDecode(respuesta.body);
    final Map<String, dynamic> serieJson = mapaSeries['tvShow'];

    SeriesDetailsApi serieDetails = SeriesDetailsApi.fromJson(serieJson);

    notifyListeners();
    return serieDetails;
  }
}
