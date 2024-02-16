class Main {
  String? id;
  String? clientId;
  String? projectId;
  String? ticketTypeId;
  String? title;
  String? createdBy;
  String? requestedBy;
  String? createdAt;
  String? status;
  String? lastActivityAt;
  String? assignedTo;
  String? creatorName;
  String? creatorEmail;
  String? labels;
  String? taskId;
  String? closedAt;
  String? deleted;

  Main({
    this.id,
    this.clientId,
    this.projectId,
    this.ticketTypeId,
    this.title,
    this.createdBy,
    this.requestedBy,
    this.createdAt,
    this.status,
    this.lastActivityAt,
    this.assignedTo,
    this.creatorName,
    this.creatorEmail,
    this.labels,
    this.taskId,
    this.closedAt,
    this.deleted,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        id: json['id'] as String?,
        clientId: json['client_id'] as String?,
        projectId: json['project_id'] as String?,
        ticketTypeId: json['ticket_type_id'] as String?,
        title: json['title'] as String?,
        createdBy: json['created_by'] as String?,
        requestedBy: json['requested_by'] as String?,
        createdAt: json['created_at'] as String?,
        status: json['status'] as String?,
        lastActivityAt: json['last_activity_at'] as String?,
        assignedTo: json['assigned_to'] as String?,
        creatorName: json['creator_name'] as String?,
        creatorEmail: json['creator_email'] as String?,
        labels: json['labels'] as String?,
        taskId: json['task_id'] as String?,
        closedAt: json['closed_at'] as String?,
        deleted: json['deleted'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'client_id': clientId,
        'project_id': projectId,
        'ticket_type_id': ticketTypeId,
        'title': title,
        'created_by': createdBy,
        'requested_by': requestedBy,
        'created_at': createdAt,
        'status': status,
        'last_activity_at': lastActivityAt,
        'assigned_to': assignedTo,
        'creator_name': creatorName,
        'creator_email': creatorEmail,
        'labels': labels,
        'task_id': taskId,
        'closed_at': closedAt,
        'deleted': deleted,
      };
}
