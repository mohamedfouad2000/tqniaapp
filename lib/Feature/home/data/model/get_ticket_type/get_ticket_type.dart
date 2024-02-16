class TicketType {
  int? id;
  String? name;

  TicketType({this.id, this.name});

  factory TicketType.fromJson(Map<String, dynamic> json) => TicketType(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
