class AssginTo {
  String? id;
  String? text;

  AssginTo({this.id, this.text});

  factory AssginTo.fromJson(Map<String, dynamic> json) => AssginTo(
        id: json['id'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
      };
}
