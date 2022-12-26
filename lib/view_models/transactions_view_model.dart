import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/models/my_response/my_response.dart';
import 'package:dio_example_n6/data/models/tranfer/transaction_model.dart';
import 'package:dio_example_n6/data/repository/transactions_repo.dart';
import 'package:flutter/cupertino.dart';

class TransactionsViewModel extends ChangeNotifier {
  TransactionsViewModel({required this.transactionsRepo}){
    fetchTransactions();
  }

  List<TransactionModel> transactions = [];

  String errorForUI = "";

  TransactionsRepo transactionsRepo;

  fetchTransactions() async {
    MyResponse myResponse = await transactionsRepo.getAllTransactions();
    if (myResponse is MyResponseSuccess) {
      transactions = myResponse.data as List<TransactionModel>;
    } else {
      errorForUI = (myResponse as MyResponseError).error;
    }
    notifyListeners();
  }
}
