class ClientModel {
  int? id;
  String? name;

  ClientModel({this.id, this.name});

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
