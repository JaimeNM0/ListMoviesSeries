class Series {
  final int id;
  final String name;
  final String startDate;
  final String image;

  Series(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.image});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      name: json['name'],
      startDate: json['start_date'],
      image: json['image_thumbnail_path'],
    );
  }
}