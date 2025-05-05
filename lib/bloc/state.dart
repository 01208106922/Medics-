import '../model/details_model.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class GetMedicsDataLoadingState extends HomeStates {}

class GetMedicsDataSuccessState extends HomeStates {}

class GetMedicsDataErrorState extends HomeStates {
  final String? message; // إضافة المعلمة message

  GetMedicsDataErrorState({this.message});
}

class GetMedicsListSuccessState extends HomeStates {
  final List<Drug> drugsList;

  GetMedicsListSuccessState(this.drugsList);
}
