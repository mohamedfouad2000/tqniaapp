class Notification {
  String? id;
  String? title;
  String? body;
  String? modelId;
  String? modelType;
  String? userId;
  String? isRead;
  String? createdAt;

  Notification({
    this.id,
    this.title,
    this.body,
    this.modelId,
    this.modelType,
    this.userId,
    this.isRead,
    this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json['id'] as String?,
        title: json['title'] as String?,
        body: json['body'] as String?,
        modelId: json['model_id'] as String?,
        modelType: json['model_type'] as String?,
        userId: json['user_id'] as String?,
        isRead: json['is_read'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'model_id': modelId,
        'model_type': modelType,
        'user_id': userId,
        'is_read': isRead,
        'created_at': createdAt,
      };
}
