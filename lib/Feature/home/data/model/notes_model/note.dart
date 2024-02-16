class Note {
  String? id;
  String? createdBy;
  String? createdAt;
  String? title;
  String? description;
  String? projectId;
  String? contractId;
  String? clientId;
  String? userId;
  String? labels;
  List<dynamic>? files;
  String? isPublic;
  String? deleted;
  String? createdByUserName;
  dynamic labelsList;

  Note({
    this.id,
    this.createdBy,
    this.createdAt,
    this.title,
    this.description,
    this.projectId,
    this.contractId,
    this.clientId,
    this.userId,
    this.labels,
    this.files,
    this.isPublic,
    this.deleted,
    this.createdByUserName,
    this.labelsList,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'] as String?,
        createdBy: json['created_by'] as String?,
        createdAt: json['created_at'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        projectId: json['project_id'] as String?,
        contractId: json['contract_id'] as String?,
        clientId: json['client_id'] as String?,
        userId: json['user_id'] as String?,
        labels: json['labels'] as String?,
        files: json['files'] as List<dynamic>?,
        isPublic: json['is_public'] as String?,
        deleted: json['deleted'] as String?,
        createdByUserName: json['created_by_user_name'] as String?,
        labelsList: json['labels_list'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_by': createdBy,
        'created_at': createdAt,
        'title': title,
        'description': description,
        'project_id': projectId,
        'contract_id': contractId,
        'client_id': clientId,
        'user_id': userId,
        'labels': labels,
        'files': files,
        'is_public': isPublic,
        'deleted': deleted,
        'created_by_user_name': createdByUserName,
        'labels_list': labelsList,
      };
}
