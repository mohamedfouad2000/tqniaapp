import 'notification.dart';

class Data {
  List<Notification>? notifications;
  int? count;

  Data({this.notifications, this.count});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'notifications': notifications?.map((e) => e.toJson()).toList(),
        'count': count,
      };
}
