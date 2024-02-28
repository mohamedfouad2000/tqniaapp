import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/model/client_model/client_model.dart';
import 'package:tqniaapp/Feature/home/data/model/get_ticket_type/get_ticket_type.dart';
import 'package:tqniaapp/Feature/home/data/model/label_model/label_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/addticket/addticket_state.dart';

class AddticketCubit extends Cubit<AddticketState> {
  AddticketCubit(this.repo) : super(AddticketInitial());
  static AddticketCubit get(context) => BlocProvider.of(context);
  final AddTicketRepo repo;
  LabelModel? labels;
  List<ClientModel> clients = [];
  List<ClientModel> assginTo = [];
  List<ClientModel> requestedBy = [];
  List<ClientModel> projects = [];

  List<TicketType> ticketsTypes = [];

  Future<void> getLabels() async {
    emit(GetLabelsloading());
    var resp = await repo.getlabels();
    resp.fold(
        (failure) => emit(GetLabelsFailure(errorMsq: failure.msq.toString())),
        (r) {
      labels = r;
      emit(GetLabelsSucc());
    });
  }

  Future<void> getClients() async {
    emit(GetClientsloading());
    var resp = await repo.getclients();
    resp.fold(
        (failure) => emit(GetClientsFailuire(errorMsq: failure.msq.toString())),
        (r) {
      clients = r;
      emit(GetClientsSucc());
    });
  }

  Future<void> getTicketTypes() async {
    emit(GetTicketsTypeloading());
    var resp = await repo.getTicketsTypes();
    resp.fold(
        (failure) =>
            emit(GetTicketsTypeFailuire(errorMsq: failure.msq.toString())),
        (r) {
      ticketsTypes = r;
      emit(GetTicketsTypeSucc());
    });
  }

  Future<void> addTicket({
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
    print(file);
    emit(AddTicketloading());
    var res = await repo.addTicket(
        title: title,
        id: id,
        projectId: projectId,
        tickettypeid: tickettypeid,
        clientid: clientid,
        assignedto: assignedto,
        labels: labels,
        requestedbyid: requestedbyid,
        description: description,
        file: file);
    res.fold(
        (failure) => emit(AddTicketFailuire(errorMsq: failure.msq.toString())),
        (r) {
      emit(AddTicketSucc(r));
    });
  }

  Future<void> getTicketById({required int id}) async {
    emit(GetticketByIdloading());
    var res = await repo.geTicketById(id: id);
    res.fold((f) {
      emit(GetticketByIdFailuire(errorMsq: f.msq.toString()));
    }, (model) {
      emit(GetticketByIdSucc(model));
    });
  }

  Future<void> checkAddTicketPermission({int id = 0}) async {
    emit(CheckPermisionloading());
    var res = await repo.checkAddTicketPermission(id: id);
    res.fold((f) {
      emit(CheckPermisionFailuire(errorMsq: f.msq.toString()));
    }, (msq) {
      emit(CheckPermisionSucc(msq));
    });
  }

  Future<void> getAssginTo() async {
    emit(GetAssignToloading());
    var resp = await repo.getAssginTo();
    resp.fold(
        (failure) =>
            emit(GetAssignToFailuire(errorMsq: failure.msq.toString())), (r) {
      assginTo = r;
      emit(GetAssignToSucc());
    });
  }

  Future<void> getProjects() async {
    emit(GetProjectsloading());
    var resp = await repo.getProjects();
    resp.fold(
        (failure) =>
            emit(GetProjectsFailuire(errorMsq: failure.msq.toString())), (r) {
      projects = r;
      emit(GetProjectsSucc());
    });
  }

  Future<void> getRequestedBy() async {
    emit(GetRequestedByloading());
    var resp = await repo.getRequestedBy();
    resp.fold(
        (failure) =>
            emit(GetRequestedByFailuire(errorMsq: failure.msq.toString())),
        (r) {
      requestedBy = r;
      emit(GetRequestedBySucc());
    });
  }

  Future<void> addCommentToTicket(
      {required int id, required String description}) async {
    emit(AddCommentloading());
    var resp = await repo.addCommentToTicket(id: id, description: description);
    resp.fold(
        (failure) => emit(AddCommentFailuire(errorMsq: failure.msq.toString())),
        (r) {
      emit(AddCommentSucc(r));
    });
  }

  Future<void> getAllFiled() async {
    emit(GetAllFiledloading());
    getLabels().then((value) {
      getTicketTypes().then((value) {
        getAssginTo().then((value) => {emit(GetAllFiledSucc())});
      });
    }).catchError(
        (onError) {
          emit(GetAllFiledFailuire(errorMsq: 'Opps Error $onError'));
        });
  }
}
