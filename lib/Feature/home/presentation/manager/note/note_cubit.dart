import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_note_repo/add_note_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/note/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this.repo) : super(NoteInitial());
  static NoteCubit get(context) => BlocProvider.of(context);
  final AddNoteRepo repo;
  Future<void> getNotes() async {
    emit(GetNotesLoading());
    var res = await repo.getNotes();
    res.fold((l) {
      emit(GetNotesFail(l.msq.toString()));
    }, (r) {
      emit(GetNotesSucc(r));
    });
  }

  Future<void> addNote({
    required String date,
    required String id,
    required String title,
    required String description,
    required File file,
  }) async {
    emit(AddNoteLoading());
    var res = await repo.addNote(
        date: date, id: id, title: title, description: description, file: file);
    res.fold((l) {
      emit(AddNoteFail(l.msq.toString()));
    }, (r) {
      emit(AddNoteSucc(r));
    });
  }
}
