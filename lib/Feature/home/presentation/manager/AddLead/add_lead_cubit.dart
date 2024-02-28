import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Feature/home/data/model/owener_model/owener_model.dart';
import 'package:tqniaapp/Feature/home/data/model/source_model/source_model.dart';
import 'package:tqniaapp/Feature/home/data/model/status_model/status_model.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repo.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/AddLead/add_lead_state.dart';

class AddLeadCubit extends Cubit<AddLeadState> {
  AddLeadCubit(this.homrepo) : super(AddLeadInitial());
  static AddLeadCubit get(context) => BlocProvider.of(context);
  final HomeRepo homrepo;
  List<SourceModel> sourceModel = [];
  List<StatusModel> statusModel = [];
  List<OwenerModel> ownerModel = [];
  List<String> regionList = [];

  Future<void> getLeadStatus() async {
    emit(GetLeadStatusLoading());
    var result = await homrepo.getLeadStatus();
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(GetLeadStatusEroor(failure.msq));
    }, (status) {
      statusModel = status;
      emit(GetLeadStatusSucc());
    });
  }

  Future<void> getLeadSources() async {
    emit(GetSourceLoading());
    var result = await homrepo.getLeadSources();
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(GetSourceEroor(failure.msq));
    }, (status) {
      sourceModel = status;
      emit(GetSourceSucc());
    });
  }

  Future<void> getOwners() async {
    emit(GetOwnerLoading());
    var result = await homrepo.getOwners();
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(GetOwnerEroor(failure.msq));
    }, (status) {
      ownerModel = status;
      emit(GetOwnerSucc());
    });
  }

  Future<void> addNewLeeds(
      {required String website,
      required String leadName,
      required String country,
      int id = 0,
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
      required String note}) async {
    emit(CreatnewLeadLoading());

    var result = await homrepo.addleadForm(
        website: website,
        leadName: leadName,
        id: id,
        country: country,
        status: status,
        owner: owner,
        source: source,
        address: address,
        city: city,
        state: state,
        zip: zip,
        currency: currency,
        phone: phone,
        mobile: mobile,
        industry: industry,
        region: region,
        note: note);

    result.fold((failure) {
      emit(CreatnewLeadEroor(failure.msq));
    }, (id) {
      emit(CreatnewLeadSucc(id));
    });
  }

  Future<void> getRegion() async {
    emit(GetRegionLoading());
    var result = await homrepo.getRegion();
    result.fold((failure) {
      print(failure.msq);
      emit(GetRegionEroor(failure.msq));
    }, (list) {
      regionList = list;
      emit(GetRegionSucc(list));
    });
  }
}
