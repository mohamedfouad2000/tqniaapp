import 'note.dart';

class Data {
  List<Note>? notes;

  Data({this.notes});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notes: (json['notes'] as List<dynamic>?)
            ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'notes': notes?.map((e) => e.toJson()).toList(),
      };
}
