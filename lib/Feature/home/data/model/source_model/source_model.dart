class SourceModel {
  String? id;
  String? title;
  String? sort;
  String? deleted;

  SourceModel({this.id, this.title, this.sort, this.deleted});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        sort: json['sort'] as String?,
        deleted: json['deleted'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'sort': sort,
        'deleted': deleted,
      };
}
