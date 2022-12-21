import 'package:dio_example_n6/data/models/tranfer/recive_model.dart';

class DataModel {
  int transactionCode;
  String date;
  int expenseId;
  double amount;
  int cardId;
  ReceiveModel receiver;

  DataModel({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiver,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      transactionCode: jsonData['transaction_code'] as int? ?? 0,
      date: jsonData['date'] as String? ?? '',
      expenseId: jsonData['expense_id'] as int? ?? 0,
      amount: jsonData['amount'] as double? ?? 0.0,
      cardId: jsonData['card_id'] as int? ?? 0,
      receiver: ReceiveModel.fromJson(jsonData['receiver']),
    );
  }
}
