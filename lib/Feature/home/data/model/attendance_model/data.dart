class Data {
  String? id;
  String? status;
  String? userId;
  String? inTime;
  dynamic outTime;
  dynamic checkedBy;
  dynamic note;
  dynamic checkedAt;
  dynamic rejectReason;
  String? deleted;

  Data({
    this.id,
    this.status,
    this.userId,
    this.inTime,
    this.outTime,
    this.checkedBy,
    this.note,
    this.checkedAt,
    this.rejectReason,
    this.deleted,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as String?,
        status: json['status'] as String?,
        userId: json['user_id'] as String?,
        inTime: json['in_time'] as String?,
        outTime: json['out_time'] as dynamic,
        checkedBy: json['checked_by'] as dynamic,
        note: json['note'] as dynamic,
        checkedAt: json['checked_at'] as dynamic,
        rejectReason: json['reject_reason'] as dynamic,
        deleted: json['deleted'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'user_id': userId,
        'in_time': inTime,
        'out_time': outTime,
        'checked_by': checkedBy,
        'note': note,
        'checked_at': checkedAt,
        'reject_reason': rejectReason,
        'deleted': deleted,
      };
}
