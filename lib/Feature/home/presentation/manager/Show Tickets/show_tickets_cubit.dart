import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/model/tickets_model/tickets_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/add_ticket_repo/add_ticket_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/Show%20Tickets/show_tickets_state.dart';

class ShowTicketsCubit extends Cubit<ShowTicketsState> {
  ShowTicketsCubit(this.repo) : super(ShowTicketsInitial());
  static ShowTicketsCubit get(context) => BlocProvider.of(context);

  final AddTicketRepo repo;
  TicketsModel? ticketsModel;
  Future<void> getTicketsList({
    required String ticketLabel,
    required String ticketType,
    required String assignedTo,
    required String search,
    required String status,
  }) async {
    emit(GetTicketsListloading());
    //open,new,inprogress
    var res = await repo.getTicketsList(
        ticketLabel: ticketLabel,
        ticketType: ticketType,
        assignedTo: assignedTo,
        status: status,
        search: search);
    res.fold(
        (failure) =>
            emit(GetTicketsListFailuire(errorMsq: failure.msq.toString())),
        (r) {
      ticketsModel = r;
      emit(GetTicketsListSucc(r));
    });
  }
}
