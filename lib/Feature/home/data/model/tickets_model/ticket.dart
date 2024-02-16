class Ticket {
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
  String? ticketType;
  String? companyName;
  dynamic projectTitle;
  dynamic taskTitle;
  String? assignedToUser;
  String? assignedToAvatar;
  String? labelsList;
  dynamic requestedByName;

  Ticket({
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
    this.ticketType,
    this.companyName,
    this.projectTitle,
    this.taskTitle,
    this.assignedToUser,
    this.assignedToAvatar,
    this.labelsList,
    this.requestedByName,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
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
        ticketType: json['ticket_type'] as String?,
        companyName: json['company_name'] as String?,
        projectTitle: json['project_title'] as dynamic,
        taskTitle: json['task_title'] as dynamic,
        assignedToUser: json['assigned_to_user'] as String?,
        assignedToAvatar: json['assigned_to_avatar'] as String?,
        labelsList: json['labels_list'] as String?,
        requestedByName: json['requested_by_name'] as dynamic,
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
        'ticket_type': ticketType,
        'company_name': companyName,
        'project_title': projectTitle,
        'task_title': taskTitle,
        'assigned_to_user': assignedToUser,
        'assigned_to_avatar': assignedToAvatar,
        'labels_list': labelsList,
        'requested_by_name': requestedByName,
      };
}
