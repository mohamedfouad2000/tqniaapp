import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead_model.dart';
import 'package:tqniaapp/Feature/home/data/model/owener_model/owener_model.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';
import 'package:tqniaapp/Feature/home/data/model/user_model/user_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<Either<Failure, int>> addleadForm(
      {required String website,
      required String leadName,
      required int id,
      required int status,
      required int owner,
      required int source,
      required String address,
      required String city,
      required String state,
      required String zip,
      required String currency,
      required String phone,
      required String mobile,
      required String industry,
      required String region,
      required String country,
      required String note}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
        url: ADDLEADEndPoint,
        data: FormData.fromMap({
          'token': TOKEN,
          'id': id,
          'name': leadName,
          'custom_field_15':industry,
          'company_name': leadName,
          'phone': int.parse(phone),
          'address': address,
          'custom_field_5': region,
          'city': city,
          'custom_field_1': note,
          'country': country,
          'state': state == 0 ? '' : state,
          'zip': zip,
          'website': website,
          'currency': currency,
          'owner_id': owner,
          'lead_status_id': status,
          'lead_source_id': source == 0 ? '' : source,
          'vat_number': mobile,
        }),
      );
      print(res.data);
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

  @override
  Future<Either<Failure, List<StatusModel>>> getLeadStatus() async {
    List<StatusModel> model = [];
    try {
      Response<dynamic> res =
          await DioHelper.getData(url: getLeadStatusEndPoint);

      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['status'].length; i++) {
          model.add(StatusModel.fromJson(res.data['data']['status'][i]));
        }
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
  Future<Either<Failure, List<SourceModel>>> getLeadSources() async {
    try {
      List<SourceModel> model = [];
      Response<dynamic> res =
          await DioHelper.getData(url: getLeadSourcesEndPoint);
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data']['sources'].length; i++) {
          model.add(SourceModel.fromJson(res.data['data']['sources'][i]));
        }
        print(model.length);
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
  Future<Either<Failure, List<OwenerModel>>> getOwners() async {
    List<OwenerModel> model = [];
    try {
      Response<dynamic> res = await DioHelper.getData(url: getOwnersEndPoint);
      if (res.data['status'] == 200) {
        for (var i = 0;
            i < res.data['data']['team_members_dropdown'].length;
            i++) {
          model.add(OwenerModel.fromJson(
              res.data['data']['team_members_dropdown'][i]));
        }

        print(model.length);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeadModel>> getHomeLeads(
      {required String status,
      required String search,
      required String source,
      required String date}) async {
    try {
      LeadModel model;
      print('siu');
      Response<dynamic> res =
          await DioHelper.getData(url: getListLeadEndPoint, query: {
        'token': TOKEN,
        'limit': 35,
        'skip': 0,
        'status': status,
        'date_types': date,
        'source': source,
        'search_by':search
      });
      if (res.data['status'] == 200) {
        model = LeadModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      UserModel model;
      print('siu');
      Response<dynamic> res =
          await DioHelper.getData(url: getUserDataEndPoint, query: {
        'token': TOKEN,
      });
      print('ahahshdhuaud');
      print(res.data);
      if (res.data['status'] == 200) {
        model = UserModel.fromJson(res.data);

        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Lead>> geLeadById({required int id}) async {
    try {
      Lead model;
      print('siu');
      Response<dynamic> res = await DioHelper.getData(
          url: getApiLeadsByIdEndPoint, query: {'token': TOKEN, 'id': id});
      print(res.data);
      if (res.data['status'] == 200) {
        print('x');
        model = Lead.fromJson(res.data['data']['leads']);
        print('z');
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> delateLead({required int id}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
        url: DeleteLeadEndPoint,
        data: FormData.fromMap({
          'token': TOKEN,
          'id': id,
        }),
      );
      print(res.data);
      if (res.data["status"] == 200) {
        return right(res.data['message'].toString());
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
  Future<Either<Failure, String>> editUserData(
      {required String fname,
      required String lname,
      required String mobile,
      required String password}) async {
    try {
      print(TOKEN);
      print(USERID);
      print(fname);
      print(lname);
      print(mobile);
      print(password);

      Response<dynamic> res = await DioHelper.postData(
          url: editProfileEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            'user_id': USERID,
            'first_name': fname,
            'last_name': lname,
            'phone': mobile,
            'password': password,
          }));
      if (res.data['status'] == 200) {
        return right(res.data['message'].toString());
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> editUserImage({required File image}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: UpdateProfileimageEndPoint,
          data: FormData.fromMap({
            'token': TOKEN,
            "profile_image_file": await MultipartFile.fromFile(image.path,
                filename: image.path.split('/').last)
          }));
      if (res.data['status'] == 200) {
        return right(res.data['message'].toString());
      } else {
        return left(ServerFailure(msq: res.data['message'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        print('//////////////////');

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getRegion() async {
    try {
      List<String> list = [];

      Response<dynamic> res = await DioHelper.getData(
        url: getRegionEndPoint,
      );
      print(res.data);
      if (res.data['status'] == 200) {
        for (var i = 0; i < res.data['data'].length; i++) {
          list.add(res.data['data'][i].toString());
        }

        return right(list);
      } else {
        return left(ServerFailure(msq: res.data['message']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}
