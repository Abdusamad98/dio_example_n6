import 'package:dio_example_n6/data/repository/dynamic_view_repo.dart';
import 'package:dio_example_n6/services/service_locator.dart';
import 'package:dio_example_n6/ui/dynamic_view_screen/dynamic_views_screen.dart';
import 'package:dio_example_n6/view_models/dynamic_view_model.dart';
import 'package:dio_example_n6/view_models/transactions_view_model.dart';
import 'package:dio_example_n6/data/api_service/api_service.dart';
import 'package:dio_example_n6/data/repository/transactions_repo.dart';
import 'package:dio_example_n6/ui/transactions/simple_usage.dart';
import 'package:dio_example_n6/ui/upload_file/upload_file_toserver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocators();
  runApp(ChangeNotifierProvider(
    create: (context) => DynamicViewModel(),
    child: MyApp(),
  ));
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
      home: DynamicViewPage(),
    );
  }
}
