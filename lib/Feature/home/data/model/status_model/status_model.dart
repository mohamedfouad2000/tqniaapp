class StatusModel {
  String? id;
  String? title;
  String? color;
  String? sort;
  String? deleted;
  String? totalLeads;

  StatusModel({
    this.id,
    this.title,
    this.color,
    this.sort,
    this.deleted,
    this.totalLeads,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        color: json['color'] as String?,
        sort: json['sort'] as String?,
        deleted: json['deleted'] as String?,
        totalLeads: json['total_leads'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'color': color,
        'sort': sort,
        'deleted': deleted,
        'total_leads': totalLeads,
      };
}
