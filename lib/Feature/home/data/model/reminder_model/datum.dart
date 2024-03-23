class Datum {
  String? id;
  String? title;
  String? startDate;
  String? startTime;
  dynamic nextRecurringTime;
  String? noOfCyclesCompleted;
  String? reminderStatus;
  String? recurring;
  String? repeatEvery;
  String? repeatType;
  String? noOfCycles;
  String? lastStartDate;
  String? recurringDates;
  String? createdById;
  String? createdByName;

  Datum({
    this.id,
    this.title,
    this.startDate,
    this.startTime,
    this.nextRecurringTime,
    this.noOfCyclesCompleted,
    this.reminderStatus,
    this.recurring,
    this.repeatEvery,
    this.repeatType,
    this.noOfCycles,
    this.lastStartDate,
    this.recurringDates,
    this.createdById,
    this.createdByName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as String?,
        title: json['title'] as String?,
        startDate: json['start_date'] as String?,
        startTime: json['start_time'] as String?,
        nextRecurringTime: json['next_recurring_time'] as dynamic,
        noOfCyclesCompleted: json['no_of_cycles_completed'] as String?,
        reminderStatus: json['reminder_status'] as String?,
        recurring: json['recurring'] as String?,
        repeatEvery: json['repeat_every'] as String?,
        repeatType: json['repeat_type'] as String?,
        noOfCycles: json['no_of_cycles'] as String?,
        lastStartDate: json['last_start_date'] as String?,
        recurringDates: json['recurring_dates'] as String?,
        createdById: json['created_by_id'] as String?,
        createdByName: json['created_by_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'start_date': startDate,
        'start_time': startTime,
        'next_recurring_time': nextRecurringTime,
        'no_of_cycles_completed': noOfCyclesCompleted,
        'reminder_status': reminderStatus,
        'recurring': recurring,
        'repeat_every': repeatEvery,
        'repeat_type': repeatType,
        'no_of_cycles': noOfCycles,
        'last_start_date': lastStartDate,
        'recurring_dates': recurringDates,
        'created_by_id': createdById,
        'created_by_name': createdByName,
      };
}
