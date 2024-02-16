class Datum {
  String? id;
  String? name;
  dynamic image;

  Datum({this.id, this.name, this.image});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
