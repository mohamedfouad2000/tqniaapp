class OwenerModel {
  String? id;
  String? name;

  OwenerModel({this.id, this.name});

  factory OwenerModel.fromJson(Map<String, dynamic> json) => OwenerModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
