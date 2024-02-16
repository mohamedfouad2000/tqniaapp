sealed class AddLeadState {}

final class AddLeadInitial extends AddLeadState {}

final class GetLeadStatusLoading extends AddLeadState {}

final class GetLeadStatusSucc extends AddLeadState {
  // final List<StatusModel> statusModel;
  GetLeadStatusSucc();
}

final class GetLeadStatusEroor extends AddLeadState {
  final String errorText;
  GetLeadStatusEroor(this.errorText);
}

final class GetSourceLoading extends AddLeadState {}

final class GetSourceSucc extends AddLeadState {
  // final List<SourceModel> sourceModel;
  GetSourceSucc();
}

final class GetSourceEroor extends AddLeadState {
  final String errorText;
  GetSourceEroor(this.errorText);
}

final class GetOwnerLoading extends AddLeadState {}

final class GetOwnerSucc extends AddLeadState {
  // final List<SourceModel> sourceModel;
  GetOwnerSucc();
}

final class GetOwnerEroor extends AddLeadState {
  final String errorText;
  GetOwnerEroor(this.errorText);
}

final class CreatnewLeadLoading extends AddLeadState {}

final class CreatnewLeadSucc extends AddLeadState {
  final int id;

  CreatnewLeadSucc(this.id);
}

final class CreatnewLeadEroor extends AddLeadState {
  final String errorText;
  CreatnewLeadEroor(this.errorText);
}
