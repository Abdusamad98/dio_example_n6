import 'package:dio_example_n6/album_view_model.dart';
import 'package:dio_example_n6/data/api_service/api_service.dart';
import 'package:dio_example_n6/data/repository/album_repo.dart';
import 'package:dio_example_n6/simple_usage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=>AlbumViewModel(albumRepo: AlbumRepo(apiService: ApiService())),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleUsage(),
    );
  }
}


