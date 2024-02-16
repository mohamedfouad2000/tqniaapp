class Notifications {
  String? id;
  String? userId;
  String? description;
  String? createdAt;
  String? notifyTo;
  String? readBy;
  String? event;
  String? projectId;
  String? taskId;
  String? projectCommentId;
  String? ticketId;
  String? ticketCommentId;
  String? projectFileId;
  String? leaveId;
  String? postId;
  String? toUserId;
  String? activityLogId;
  String? clientId;
  String? leadId;
  String? invoicePaymentId;
  String? invoiceId;
  String? estimateId;
  String? contractId;
  String? orderId;
  String? estimateRequestId;
  String? actualMessageId;
  String? parentMessageId;
  String? eventId;
  String? announcementId;
  String? proposalId;
  String? estimateCommentId;
  String? deleted;
  String? userName;
  String? userImage;
  String? projectTitle;
  dynamic projectCommentTitle;
  dynamic projectFileTitle;
  dynamic contractTitle;
  dynamic contractMetaData;
  dynamic estimateMetaData;
  dynamic proposalMetaData;
  String? taskTitle;
  dynamic eventTitle;
  dynamic ticketTitle;
  dynamic ticketCommentDescription;
  dynamic postsTitle;
  dynamic announcementTitle;
  dynamic estimateCommentDescription;
  dynamic activityLogChanges;
  dynamic activityLogType;
  dynamic leaveStartDate;
  dynamic leaveEndDate;
  dynamic paymentInvoiceId;
  dynamic paymentAmount;
  dynamic clientCurrencySymbol;
  dynamic toUserName;
  String? isRead;

  Notifications({
    this.id,
    this.userId,
    this.description,
    this.createdAt,
    this.notifyTo,
    this.readBy,
    this.event,
    this.projectId,
    this.taskId,
    this.projectCommentId,
    this.ticketId,
    this.ticketCommentId,
    this.projectFileId,
    this.leaveId,
    this.postId,
    this.toUserId,
    this.activityLogId,
    this.clientId,
    this.leadId,
    this.invoicePaymentId,
    this.invoiceId,
    this.estimateId,
    this.contractId,
    this.orderId,
    this.estimateRequestId,
    this.actualMessageId,
    this.parentMessageId,
    this.eventId,
    this.announcementId,
    this.proposalId,
    this.estimateCommentId,
    this.deleted,
    this.userName,
    this.userImage,
    this.projectTitle,
    this.projectCommentTitle,
    this.projectFileTitle,
    this.contractTitle,
    this.contractMetaData,
    this.estimateMetaData,
    this.proposalMetaData,
    this.taskTitle,
    this.eventTitle,
    this.ticketTitle,
    this.ticketCommentDescription,
    this.postsTitle,
    this.announcementTitle,
    this.estimateCommentDescription,
    this.activityLogChanges,
    this.activityLogType,
    this.leaveStartDate,
    this.leaveEndDate,
    this.paymentInvoiceId,
    this.paymentAmount,
    this.clientCurrencySymbol,
    this.toUserName,
    this.isRead,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        description: json['description'] as String?,
        createdAt: json['created_at'] as String?,
        notifyTo: json['notify_to'] as String?,
        readBy: json['read_by'] as String?,
        event: json['event'] as String?,
        projectId: json['project_id'] as String?,
        taskId: json['task_id'] as String?,
        projectCommentId: json['project_comment_id'] as String?,
        ticketId: json['ticket_id'] as String?,
        ticketCommentId: json['ticket_comment_id'] as String?,
        projectFileId: json['project_file_id'] as String?,
        leaveId: json['leave_id'] as String?,
        postId: json['post_id'] as String?,
        toUserId: json['to_user_id'] as String?,
        activityLogId: json['activity_log_id'] as String?,
        clientId: json['client_id'] as String?,
        leadId: json['lead_id'] as String?,
        invoicePaymentId: json['invoice_payment_id'] as String?,
        invoiceId: json['invoice_id'] as String?,
        estimateId: json['estimate_id'] as String?,
        contractId: json['contract_id'] as String?,
        orderId: json['order_id'] as String?,
        estimateRequestId: json['estimate_request_id'] as String?,
        actualMessageId: json['actual_message_id'] as String?,
        parentMessageId: json['parent_message_id'] as String?,
        eventId: json['event_id'] as String?,
        announcementId: json['announcement_id'] as String?,
        proposalId: json['proposal_id'] as String?,
        estimateCommentId: json['estimate_comment_id'] as String?,
        deleted: json['deleted'] as String?,
        userName: json['user_name'] as String?,
        userImage: json['user_image'] as String?,
        projectTitle: json['project_title'] as String?,
        projectCommentTitle: json['project_comment_title'] as dynamic,
        projectFileTitle: json['project_file_title'] as dynamic,
        contractTitle: json['contract_title'] as dynamic,
        contractMetaData: json['contract_meta_data'] as dynamic,
        estimateMetaData: json['estimate_meta_data'] as dynamic,
        proposalMetaData: json['proposal_meta_data'] as dynamic,
        taskTitle: json['task_title'] as String?,
        eventTitle: json['event_title'] as dynamic,
        ticketTitle: json['ticket_title'] as dynamic,
        ticketCommentDescription: json['ticket_comment_description'] as dynamic,
        postsTitle: json['posts_title'] as dynamic,
        announcementTitle: json['announcement_title'] as dynamic,
        estimateCommentDescription:
            json['estimate_comment_description'] as dynamic,
        activityLogChanges: json['activity_log_changes'] as dynamic,
        activityLogType: json['activity_log_type'] as dynamic,
        leaveStartDate: json['leave_start_date'] as dynamic,
        leaveEndDate: json['leave_end_date'] as dynamic,
        paymentInvoiceId: json['payment_invoice_id'] as dynamic,
        paymentAmount: json['payment_amount'] as dynamic,
        clientCurrencySymbol: json['client_currency_symbol'] as dynamic,
        toUserName: json['to_user_name'] as dynamic,
        isRead: json['is_read'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'description': description,
        'created_at': createdAt,
        'notify_to': notifyTo,
        'read_by': readBy,
        'event': event,
        'project_id': projectId,
        'task_id': taskId,
        'project_comment_id': projectCommentId,
        'ticket_id': ticketId,
        'ticket_comment_id': ticketCommentId,
        'project_file_id': projectFileId,
        'leave_id': leaveId,
        'post_id': postId,
        'to_user_id': toUserId,
        'activity_log_id': activityLogId,
        'client_id': clientId,
        'lead_id': leadId,
        'invoice_payment_id': invoicePaymentId,
        'invoice_id': invoiceId,
        'estimate_id': estimateId,
        'contract_id': contractId,
        'order_id': orderId,
        'estimate_request_id': estimateRequestId,
        'actual_message_id': actualMessageId,
        'parent_message_id': parentMessageId,
        'event_id': eventId,
        'announcement_id': announcementId,
        'proposal_id': proposalId,
        'estimate_comment_id': estimateCommentId,
        'deleted': deleted,
        'user_name': userName,
        'user_image': userImage,
        'project_title': projectTitle,
        'project_comment_title': projectCommentTitle,
        'project_file_title': projectFileTitle,
        'contract_title': contractTitle,
        'contract_meta_data': contractMetaData,
        'estimate_meta_data': estimateMetaData,
        'proposal_meta_data': proposalMetaData,
        'task_title': taskTitle,
        'event_title': eventTitle,
        'ticket_title': ticketTitle,
        'ticket_comment_description': ticketCommentDescription,
        'posts_title': postsTitle,
        'announcement_title': announcementTitle,
        'estimate_comment_description': estimateCommentDescription,
        'activity_log_changes': activityLogChanges,
        'activity_log_type': activityLogType,
        'leave_start_date': leaveStartDate,
        'leave_end_date': leaveEndDate,
        'payment_invoice_id': paymentInvoiceId,
        'payment_amount': paymentAmount,
        'client_currency_symbol': clientCurrencySymbol,
        'to_user_name': toUserName,
        'is_read': isRead,
      };
}
