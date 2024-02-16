import 'label.dart';

class Ticket {
  String? title;
  List<Label>? labels;
  String? status;
  String? client;
  String? assignedToName;
  String? assignedToAvatar;
  String? ticketType;
  String? createdAt;

  Ticket({
    this.title,
    this.labels,
    this.status,
    this.client,
    this.assignedToName,
    this.assignedToAvatar,
    this.ticketType,
    this.createdAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        title: json['title'] as String?,
        labels: (json['labels'] as List<dynamic>?)
            ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
        client: json['client'] as String?,
        assignedToName: json['assigned_to_name'] as String?,
        assignedToAvatar: json['assigned_to_avatar'] as String?,
        ticketType: json['ticket_type'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'labels': labels?.map((e) => e.toJson()).toList(),
        'status': status,
        'client': client,
        'assigned_to_name': assignedToName,
        'assigned_to_avatar': assignedToAvatar,
        'ticket_type': ticketType,
        'created_at': createdAt,
      };
}
