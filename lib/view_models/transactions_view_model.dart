import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/models/my_response/my_response.dart';
import 'package:dio_example_n6/data/models/tranfer/transaction_model.dart';
import 'package:dio_example_n6/data/repository/transactions_repo.dart';
import 'package:dio_example_n6/services/service_locator.dart';
import 'package:flutter/cupertino.dart';

class TransactionsViewModel extends ChangeNotifier {
  TransactionsViewModel(){
    fetchTransactions();
  }

  List<TransactionModel> transactions = [];

  String errorForUI = "";

  fetchTransactions() async {
    MyResponse myResponse = await myLocator.get<TransactionsRepo>().getAllTransactions();
    if (myResponse.error.isEmpty) {
      transactions = myResponse.data as List<TransactionModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
