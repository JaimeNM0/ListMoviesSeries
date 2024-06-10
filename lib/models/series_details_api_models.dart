class SeriesDetailsApi {
  final String id;
  final String title;
  final String note;
  final String poster;
  final String status;
  final int duration;
  final List<dynamic> genres;
  final String startDate;
  final String description;

  SeriesDetailsApi({
    required this.id,
    required this.title,
    required this.note,
    required this.poster,
    required this.status,
    required this.duration,
    required this.genres,
    required this.startDate,
    required this.description,
  });

  factory SeriesDetailsApi.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsApi(
      id: json['permalink'],
      title: json['name'],
      note: json['rating'],
      poster: json['image_thumbnail_path'],
      status: json['status'],
      duration: json['runtime']/*.toString()*/,
      genres: json['genres'],
      startDate: json['start_date'],
      description: json['description'],
    );
  }
}
