class Comment {
  String? id;
  String? createdBy;
  String? createdAt;
  String? description;
  String? ticketId;
  List<dynamic>? files;
  String? isNote;
  String? deleted;
  String? createdByUser;
  List<dynamic>? createdByAvatar;
  String? userType;
  String? creatorName;
  String? creatorEmail;

  Comment({
    this.id,
    this.createdBy,
    this.createdAt,
    this.description,
    this.ticketId,
    this.files,
    this.isNote,
    this.deleted,
    this.createdByUser,
    this.createdByAvatar,
    this.userType,
    this.creatorName,
    this.creatorEmail,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as String?,
        createdBy: json['created_by'] as String?,
        createdAt: json['created_at'] as String?,
        description: json['description'] as String?,
        ticketId: json['ticket_id'] as String?,
        files: json['files'] as List<dynamic>?,
        isNote: json['is_note'] as String?,
        deleted: json['deleted'] as String?,
        createdByUser: json['created_by_user'] as String?,
        createdByAvatar: json['created_by_avatar'] as List<dynamic>?,
        userType: json['user_type'] as String?,
        creatorName: json['creator_name'] as String?,
        creatorEmail: json['creator_email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_by': createdBy,
        'created_at': createdAt,
        'description': description,
        'ticket_id': ticketId,
        'files': files,
        'is_note': isNote,
        'deleted': deleted,
        'created_by_user': createdByUser,
        'created_by_avatar': createdByAvatar,
        'user_type': userType,
        'creator_name': creatorName,
        'creator_email': creatorEmail,
      };
}
