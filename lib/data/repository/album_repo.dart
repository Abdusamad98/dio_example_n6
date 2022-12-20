import 'package:dio_example_n6/data/api_service/api_service.dart';

import '../models/album_model.dart';

class AlbumRepo{
  AlbumRepo( {required this.apiService});
  ApiService apiService;
  Future<MyResponse> getMyAlbum (int id)=>apiService.getSingleAlbumById(id);
}