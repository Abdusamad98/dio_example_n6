import 'package:dio_example_n6/data/api_service/api_service.dart';
import 'package:dio_example_n6/data/repository/dynamic_view_repo.dart';
import 'package:dio_example_n6/data/repository/transactions_repo.dart';
import 'package:get_it/get_it.dart';

final myLocator = GetIt.instance;

setUpLocators()  {
  var apiService = ApiService();
  myLocator.registerLazySingleton(() => TransactionsRepo(apiService: apiService));
  myLocator.registerLazySingleton(() => DynamicFieldsRepo(apiService: apiService));
}
