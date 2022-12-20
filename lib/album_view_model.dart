import 'dart:async';

import 'package:dio_example_n6/data/api_service/api_service.dart';
import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/repository/album_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AlbumViewModel extends ChangeNotifier {
  AlbumViewModel({required this.albumRepo});

  Album? album;

  String errorForUI = "";

  AlbumRepo albumRepo;

  fetchAlbum(int id) async {
    MyResponse myResponse = await albumRepo.getMyAlbum(id);

    if (myResponse.error.isEmpty) {
      album = myResponse.data as Album;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
