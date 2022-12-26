import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_example_n6/data/api_service/api_client.dart';
import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/models/input_model/input_model.dart';
import 'package:dio_example_n6/data/models/my_response/my_response.dart';
import 'package:dio_example_n6/data/models/tranfer/transaction_model.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getSingleAlbumById(int id) async {
    MyResponse response = await getResponse('$baseUrl1/albums/$id');

    if (response is MyResponseSuccess) {
      return MyResponseSuccess(Album.fromJson(response.data));
    }

    return response;
  }

  Future<MyResponse> getAllAlbums() async {
    MyResponse response = await getResponse('$baseUrl1/albums');

    if (response is MyResponseSuccess) {
      return MyResponseSuccess(
          (response.data as List?)?.map((e) => Album.fromJson(e)).toList() ??
              []);
    }

    return response;
  }

  Future<MyResponse> getAllTransactions() async {
    MyResponse response = await getResponse('$baseUrl2/transactions-expenses');

    if (response is MyResponseSuccess) {
      var data = response as Map<String, dynamic>;
      return MyResponseSuccess((data as List?)
              ?.map((e) => TransactionModel.fromJson(e))
              .toList() ??
          []);
    }

    return response;
  }

  Future<MyResponse> getDynamicFields() async {
    MyResponse response = await getResponse(baseUrl3);

    if (response is MyResponseSuccess) {
      return MyResponseSuccess((response.data as List?)
              ?.map((e) => InputModel.fromJson(e))
              .toList() ??
          []);
    }

    return response;
  }

  Future<MyResponse> getResponse(String endpoint) async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}$endpoint");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return MyResponseSuccess(response.data as dynamic);
      }
      return MyResponseError('Unknown error. code: ${response.statusCode}');
    } catch (err) {
      return MyResponseError(err.toString());
    }
  }
}
