import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/notes_model/notes_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_note_repo/add_note_repo.dart';

class AddNoteRepoImp extends AddNoteRepo {
  @override
  Future<Either<Failure, NotesModel>> getNotes() async {
    NotesModel? model;
    print(TOKEN);
    print(USERID);

    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getNotesEndPoint, query: {
        'token': TOKEN,
        'client_id': USERID,
      });

      print(res.data);
      if (res.data['status'] == 200) {
        model = NotesModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addNote({
    required String date,
    required String id,
    required String title,
    required String description,
    required File file,
  }) async {
    try {
      print(TOKEN);
      print(USERID);
      print(date);
      print(title);
      print(id);
      print(file);

      Response<dynamic> res = await DioHelper.postData(
          url: AddNoteEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'id': id,
            'title': title,
            'description': description,
            'client_id': USERID,
            'manualFiles[]': await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last),
          }));
      print(res.data);
      print("object");
      if (res.data["status"] == 200) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        print(res.data["data"]['id']);
        return right(int.parse(res.data["data"]['id'].toString()));
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
