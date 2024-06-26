class Series {
  final String id;
  final String name;
  final String status;
  final String startDate;
  final String image;

  Series(
      {required this.id,
      required this.name,
      required this.status,
      required this.startDate,
      required this.image});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['permalink'],
      name: json['name'],
      status: json['status'],
      startDate: json['start_date'],
      image: json['image_thumbnail_path'],
    );
  }
}
