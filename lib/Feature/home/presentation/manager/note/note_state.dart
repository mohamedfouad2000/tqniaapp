import 'package:tqniaapp/Feature/home/data/model/notes_model/notes_model.dart';

sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class GetNotesLoading extends NoteState {}

final class GetNotesSucc extends NoteState {
  final NotesModel model;
  GetNotesSucc(this.model);
}

final class GetNotesFail extends NoteState {
  final String errorMsq;
  GetNotesFail(this.errorMsq);
}

final class AddNoteLoading extends NoteState {}

final class AddNoteSucc extends NoteState {
  final int id;
  AddNoteSucc(this.id);
}

final class AddNoteFail extends NoteState {
  final String errorMsq;
  AddNoteFail(this.errorMsq);
}
