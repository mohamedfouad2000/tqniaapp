import 'comment.dart';
import 'main.dart';
import 'ticket.dart';

class Data {
  Main? main;
  Ticket? ticket;
  List<Comment>? comments;

  Data({this.main, this.ticket, this.comments});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, dynamic>),
        ticket: json['ticket'] == null
            ? null
            : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
        comments: (json['comments'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'main': main?.toJson(),
        'ticket': ticket?.toJson(),
        'comments': comments?.map((e) => e.toJson()).toList(),
      };
}
