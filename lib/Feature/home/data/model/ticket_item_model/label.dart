class Label {
  String? text;
  String? color;

  Label({this.text, this.color});

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        text: json['text'] as String?,
        color: json['color'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'color': color,
      };
}
