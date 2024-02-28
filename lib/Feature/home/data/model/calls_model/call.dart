class Call {
  String? id;
  String? createdBy;
  String? createdAt;
  String? status;
  String? clientId;
  String? notes;
  String? description;

  String? deleted;
  String? createdByUserName;

  Call({
    this.id,
    this.createdBy,
    this.createdAt,
    this.status,
    this.clientId,
    this.notes,
    this.deleted,
    this.createdByUserName,
    this.description
  });

  factory Call.fromJson(Map<String, dynamic> json) => Call(
        id: json['id'] as String?,
        createdBy: json['created_by'] as String?,
        createdAt: json['created_at'] as String?,
        status: json['status'] as String?,
        clientId: json['client_id'] as String?,
        notes: json['notes'] as String?,
        deleted: json['deleted'] as String?,
        createdByUserName: json['created_by_user_name'] as String?,
        description : json['description'] as String?
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_by': createdBy,
        'created_at': createdAt,
        'status': status,
        'client_id': clientId,
        'notes': notes,
        'deleted': deleted,
        'created_by_user_name': createdByUserName,
        'description':description
      };
}
