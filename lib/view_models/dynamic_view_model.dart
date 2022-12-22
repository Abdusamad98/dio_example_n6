import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/models/input_model/input_model.dart';
import 'package:dio_example_n6/data/models/my_response/my_response.dart';
import 'package:dio_example_n6/data/models/tranfer/transaction_model.dart';
import 'package:dio_example_n6/data/repository/dynamic_view_repo.dart';
import 'package:dio_example_n6/data/repository/transactions_repo.dart';
import 'package:flutter/cupertino.dart';

class DynamicViewModel extends ChangeNotifier {
  DynamicViewModel({required this.dynamicFieldsRepo}) {
    fetchDynamicFields();
  }

  List<InputModel> dynamicFields = [];

  String errorForUI = "";

  DynamicFieldsRepo dynamicFieldsRepo;

  Map fields = {};

  fetchDynamicFields() async {
    MyResponse myResponse = await dynamicFieldsRepo.getDynamicData();
    if (myResponse.error.isEmpty) {
      dynamicFields = myResponse.data as List<InputModel>;
      for (int i = 0; i < dynamicFields.length; i++) {
        fields[dynamicFields[i].code] = "";
      }
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }

  updateFields(String code, dynamic inputValue){
    fields[code] = inputValue;
    print(fields);
  }




}
