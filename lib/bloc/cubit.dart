import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:medical/bloc/state.dart';

import '../model/details_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getMedicsList([int categoryId = 9]) async {
    try {
      emit(GetMedicsDataLoadingState());

      final url = Uri.parse(
        'https://cors-anywhere.herokuapp.com/http://www.onlinepharmacy.somee.com/api/product/GetProducts/${categoryId}',
      );


      http.Response response = await http.get(url);
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse != null && jsonResponse.isNotEmpty) {
          List<dynamic> drugsJson = jsonResponse;
          List<Drug> drugsList = drugsJson.map((e) => Drug.fromJson(e)).toList();
          emit(GetMedicsListSuccessState(drugsList));
        } else {
          print("No products found for this category.");
          emit(GetMedicsDataErrorState(message: "No products found for this category"));
        }
      } else {
        print("Error: Failed to load drugs list, Status Code: ${response.statusCode}");
        emit(GetMedicsDataErrorState());
      }
    } catch (e) {
      print("Exception while loading drugs list: $e");
      emit(GetMedicsDataErrorState());
    }
  }
}
