import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/notes_model/notes_model.dart';

abstract class AddNoteRepo {
  Future<Either<Failure, NotesModel>> getNotes();
  Future<Either<Failure, int>> addNote({
    required String date,
    required String id,
    required String title,
    required String description,
    required File file,
  });
}
