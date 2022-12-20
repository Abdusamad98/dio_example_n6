import 'package:dio/dio.dart';
import 'package:dio_example_n6/data/api_service/api_client.dart';
import 'package:dio_example_n6/data/models/album_model.dart';

class ApiService  extends ApiClient{


  Future<Album?> getSingleAlbumById(int id)async{
   // Dio dio = Dio();
    try{
      Response response = await dio.get("${dio.options.baseUrl}/albums/$id");
      if(response.statusCode == 200){
        return Album.fromJson(response.data);
      }
    } catch (err){
      print(err.toString());
    }
  }


  Future<List<Album>> getAllAlbums()async{
   // Dio dio = Dio();
    try{
      Response response = await dio.get("${dio.options.baseUrl}/albums");
      if(response.statusCode == 200){
        return (response.data as List?)?.map((e) => Album.fromJson(e)).toList()??[];
      }
    } catch (err){
      print(err.toString());
    }
    return [];
  }
}