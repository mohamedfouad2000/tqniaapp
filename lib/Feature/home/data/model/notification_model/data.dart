import 'notification.dart';

class Data {
  List<Notifications>? notifications;

  Data({this.notifications});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => Notifications.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'notifications': notifications?.map((e) => e.toJson()).toList(),
      };
}
