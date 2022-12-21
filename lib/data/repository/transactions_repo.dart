import 'package:dio_example_n6/data/api_service/api_service.dart';
import 'package:dio_example_n6/data/models/my_response/my_response.dart';

class TransactionsRepo{
  TransactionsRepo( {required this.apiService});
  ApiService apiService;
  Future<MyResponse> getAllTransactions()=>apiService.getAllTransactions();
}