import 'package:demo_app/screens/Viewer/viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SeezItt',
      debugShowCheckedModeBanner: false,
      initialRoute: Viewer.routeName,
      getPages: _getRoutes,
    );
  }

  List<GetPage> get _getRoutes {
    return [
      GetPage(name: Viewer.routeName, page: () => const Viewer()),
    ];
  }
}
