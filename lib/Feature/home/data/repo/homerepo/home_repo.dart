import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tqniaapp/Core/errors/failures.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/model/lead_model/lead_model.dart';

import 'package:tqniaapp/Feature/home/data/model/owener_model/owener_model.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';
import 'package:tqniaapp/Feature/home/data/model/user_model/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserModel>> getUserData();
  Future<Either<Failure, String>> editUserData({
    required String fname,
    required String lname,
    required String mobile,
    required String password,
  });
  Future<Either<Failure, String>> editUserImage({
    required File image,
  });

  Future<Either<Failure, int>> addleadForm(
      {required String website,
      required String leadName,
      required int id,
      required String country,
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
      required String note});
  Future<Either<Failure, List<StatusModel>>> getLeadStatus();
  Future<Either<Failure, List<SourceModel>>> getLeadSources();
  Future<Either<Failure, List<OwenerModel>>> getOwners();
  Future<Either<Failure, LeadModel>> getHomeLeads(
      {required String status,
      required String source,
      int skip = 0,
      required String search,
      required String date});

  Future<Either<Failure, Lead>> geLeadById({required int id});
  Future<Either<Failure, String>> delateLead({required int id});
  Future<Either<Failure, List<String>>> getRegion();
}
