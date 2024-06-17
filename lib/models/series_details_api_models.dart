class SeriesDetailsApi {
  final String id;
  final String title;
  final String note;
  final String poster;
  final String status;
  final String duration;
  final List<dynamic> genres;
  final String startDate;
  final String description;
  final String chapters;
  final String seasons;

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
    required this.chapters,
    required this.seasons,
  });

  factory SeriesDetailsApi.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsApi(
      id: json['permalink'],
      title: json['name'],
      note: json['rating'],
      poster: json['image_thumbnail_path'],
      status: json['status'],
      duration: json['runtime'].toString(),
      genres: json['genres'],
      startDate: json['start_date'],
      description: json['description'],
      chapters: json['episodes'].length.toString(),
      seasons: (json['episodes'].length-1) != -1 ? json['episodes'][(json['episodes'].length-1)]['season'].toString() : '0',
    );
  }
}
