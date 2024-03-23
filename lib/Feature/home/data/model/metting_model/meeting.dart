class Meeting {
  String? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? createdBy;
  String? location;
  String? clientId;
  String? labels;
  String? shareWith;
  String? editableGoogleEvent;
  String? googleEventId;
  String? deleted;
  String? leadId;
  String? ticketId;
  String? projectId;
  String? taskId;
  dynamic nextRecurringTime;
  String? noOfCyclesCompleted;
  dynamic snoozingTime;
  String? reminderStatus;
  String? type;
  String? color;
  String? recurring;
  String? repeatEvery;
  String? repeatType;
  String? noOfCycles;
  String? lastStartDate;
  String? recurringDates;
  String? confirmedBy;
  String? rejectedBy;
  String? files;
  String? createdByName;
  String? createdByAvatar;
  dynamic companyName;
  dynamic isLead;
  dynamic labelsList;
  String? status;
  dynamic clientName;

  Meeting(
      {this.id,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.createdBy,
      this.location,
      this.clientId,
      this.labels,
      this.shareWith,
      this.editableGoogleEvent,
      this.googleEventId,
      this.deleted,
      this.leadId,
      this.ticketId,
      this.projectId,
      this.taskId,
      this.nextRecurringTime,
      this.noOfCyclesCompleted,
      this.snoozingTime,
      this.reminderStatus,
      this.type,
      this.color,
      this.recurring,
      this.repeatEvery,
      this.repeatType,
      this.noOfCycles,
      this.lastStartDate,
      this.recurringDates,
      this.confirmedBy,
      this.rejectedBy,
      this.files,
      this.createdByName,
      this.createdByAvatar,
      this.companyName,
      this.isLead,
      this.labelsList,
      this.status,
      this.clientName});

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        startTime: json['start_time'] as String?,
        endTime: json['end_time'] as String?,
        createdBy: json['created_by'] as String?,
        location: json['location'] as String?,
        clientId: json['client_id'] as String?,
        labels: json['labels'] as String?,
        shareWith: json['share_with'] as String?,
        editableGoogleEvent: json['editable_google_event'] as String?,
        googleEventId: json['google_event_id'] as String?,
        deleted: json['deleted'] as String?,
        leadId: json['lead_id'] as String?,
        ticketId: json['ticket_id'] as String?,
        projectId: json['project_id'] as String?,
        taskId: json['task_id'] as String?,
        nextRecurringTime: json['next_recurring_time'] as dynamic,
        noOfCyclesCompleted: json['no_of_cycles_completed'] as String?,
        snoozingTime: json['snoozing_time'] as dynamic,
        reminderStatus: json['reminder_status'] as String?,
        type: json['type'] as String?,
        color: json['color'] as String?,
        recurring: json['recurring'] as String?,
        repeatEvery: json['repeat_every'] as String?,
        repeatType: json['repeat_type'] as String?,
        noOfCycles: json['no_of_cycles'] as String?,
        lastStartDate: json['last_start_date'] as String?,
        recurringDates: json['recurring_dates'] as String?,
        confirmedBy: json['confirmed_by'] as String?,
        rejectedBy: json['rejected_by'] as String?,
        files: json['files'] as String?,
        createdByName: json['created_by_name'] as String?,
        createdByAvatar: json['created_by_avatar'] as String?,
        companyName: json['company_name'] as dynamic,
        isLead: json['is_lead'] as dynamic,
        labelsList: json['labels_list'] as dynamic,
        status: json['status'] as String?,
        clientName: json['client_name'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'start_date': startDate,
        'end_date': endDate,
        'start_time': startTime,
        'end_time': endTime,
        'created_by': createdBy,
        'location': location,
        'client_id': clientId,
        'labels': labels,
        'share_with': shareWith,
        'editable_google_event': editableGoogleEvent,
        'google_event_id': googleEventId,
        'deleted': deleted,
        'lead_id': leadId,
        'ticket_id': ticketId,
        'project_id': projectId,
        'task_id': taskId,
        'next_recurring_time': nextRecurringTime,
        'no_of_cycles_completed': noOfCyclesCompleted,
        'snoozing_time': snoozingTime,
        'reminder_status': reminderStatus,
        'type': type,
        'color': color,
        'recurring': recurring,
        'repeat_every': repeatEvery,
        'repeat_type': repeatType,
        'no_of_cycles': noOfCycles,
        'last_start_date': lastStartDate,
        'recurring_dates': recurringDates,
        'confirmed_by': confirmedBy,
        'rejected_by': rejectedBy,
        'files': files,
        'created_by_name': createdByName,
        'created_by_avatar': createdByAvatar,
        'company_name': companyName,
        'is_lead': isLead,
        'labels_list': labelsList,
        'status': status,
        'client_name': clientName
      };
}
