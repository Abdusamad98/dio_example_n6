import 'dart:async';

import 'package:dio_example_n6/data/models/album_model.dart';
import 'package:dio_example_n6/data/repository/album_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class AlbumViewModel extends ChangeNotifier{

  AlbumViewModel({required this.albumRepo});

  Album? album;

  AlbumRepo albumRepo;


  fetchAlbum(int id) async{
  album = await albumRepo.getMyAlbum(id);
  notifyListeners();
  }


}