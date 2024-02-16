import 'ticket.dart';

class Data {
  List<Ticket>? ticket;

  Data({this.ticket});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ticket: (json['ticket'] as List<dynamic>?)
            ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'ticket': ticket?.map((e) => e.toJson()).toList(),
      };
}
