import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/client_model/client_model.dart';
import 'package:tqniaapp/Feature/home/data/model/get_ticket_type/get_ticket_type.dart';
import 'package:tqniaapp/Feature/home/data/model/label_model/label_model.dart';
import 'package:tqniaapp/Feature/home/data/model/ticket_item_model/ticket_item_model.dart';
import 'package:tqniaapp/Feature/home/data/model/tickets_model/tickets_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo.dart';

class AddTicketRepoImpl extends AddTicketRepo {
  @override
  Future<Either<Failure, LabelModel>> getlabels() async {
    LabelModel? model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: getLabalsEndPoint);
      model = LabelModel.fromJson(res.data);
      if (res.data['status'] == 200) {
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
  Future<Either<Failure, List<ClientModel>>> getclients() async {
    List<ClientModel> model = [];
    try {
      Response<dynamic> res = await DioHelper.getData(url: getClientsEndPoint);
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['clients'].length; i++) {
          model.add(ClientModel.fromJson(res.data['data']['clients'][i]));
        }
        return right(model);
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

  @override
  Future<Either<Failure, List<TicketType>>> getTicketsTypes() async {
    List<TicketType> model = [];
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: getTicketsTypesEndPoint, query: {'token': TOKEN});
      print(res.data['data']['tickets'][0]['id'].runtimeType);
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['tickets'].length; i++) {
          model.add(TicketType.fromJson(res.data['data']['tickets'][i]));
        }
        return right(model);
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

  @override
  Future<Either<Failure, TicketsModel>> getTicketsList({
    required String ticketLabel,
    required String ticketType,
    required String assignedTo,
    required String status,
    required String search,
  }) async {
    TicketsModel? model;

    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getticketsByClientEndPoint, query: {
        'token': TOKEN,
        'status[]': status != '' ? status : 'open,new,inprogress',
        if (ticketLabel != '') 'ticket_label': ticketLabel,
        if (ticketType != '') 'ticket_type_id': ticketType,
        if (assignedTo != '') 'assigned_to': assignedTo,
        if (search != '') 'search_by': search
      });
      print(res.data);
      if (res.data['status'] == 200) {
        model = TicketsModel.fromJson(res.data);
        return right(model);
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

  @override
  Future<Either<Failure, int>> addTicket({
    required String title,
    required String id,
    required String projectId,
    required String tickettypeid,
    required String clientid,
    required String assignedto,
    required String labels,
    required String requestedbyid,
    required String description,
    File? file,
  }) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: addTicketEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'id': id,
            'title': title,
            'project_id': projectId,
            'ticket_type_id': tickettypeid,
            'client_id': clientid,
            'assigned_to': assignedto,
            'labels': labels,
            'description': description,
            if (file != null)
              'manualFiles[]': await MultipartFile.fromFile(file.path,
                  filename: file.path.split('/').last),
          }));
      print(res.data);
      print("object");
      if (res.data["status"] == 200) {
        // print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
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

  @override
  Future<Either<Failure, TicketItemModel>> geTicketById(
      {required int id}) async {
    try {
      TicketItemModel model;
      print(id);
      print(TOKEN);
      Response<dynamic> res = await DioHelper.getData(
          url: getTicketByIdEndPoint, query: {'token': TOKEN, 'id': id});
      print(res.data);
      if (res.data['status'] == 200) {
        model = TicketItemModel.fromJson(res.data);
        return right(model);
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> checkAddTicketPermission(
      {required int id}) async {
    try {
      print(TOKEN);
      print(USERID);
      Response<dynamic> res = await DioHelper.getData(
          url: checkPermisionEndPoint,
          query: {
            'token': TOKEN,
            'client_id': USERID,
            'id': id == 0 ? '' : '$id'
          });
      print(res.data);
      if (res.data['status'] == 200) {
        return right(res.data['message']);
      } else {
        print(res.data['message'].toString());
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClientModel>>> getAssginTo() async {
    //
    List<ClientModel> model = [];
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: getAssginToEndPoint, query: {'token': TOKEN});
      print((res.data));
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['assgin_to'].length; i++) {
          model.add(ClientModel.fromJson(res.data['data']['assgin_to'][i]));
        }
        return right(model);
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

  @override
  Future<Either<Failure, List<ClientModel>>> getProjects() async {
    List<ClientModel> model = [];
    try {
      Response<dynamic> res = await DioHelper.getData(
          url: getProjectsEndPoint, query: {'token': TOKEN});
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['projects'].length; i++) {
          model.add(ClientModel.fromJson(res.data['data']['projects'][i]));
        }
        return right(model);
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

  @override
  Future<Either<Failure, List<ClientModel>>> getRequestedBy() async {
    List<ClientModel> model = [];

    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getRequestedByEndPoint);
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['requested_by'].length; i++) {
          model.add(ClientModel.fromJson(res.data['data']['requested_by'][i]));
        }
        return right(model);
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

  @override
  Future<Either<Failure, String>> addCommentToTicket(
      {required int id, required String description}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: addCommentToTicketEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'id': id,
            'description': description,
            'is_note': 0
          }));

      if (res.data['status'] == 200) {
        return right(res.data['message']);
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
