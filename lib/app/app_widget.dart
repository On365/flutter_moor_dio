import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_moor/app/database/database.dart';
import 'package:using_moor/app/modules/home/home_controller.dart';
import 'package:using_moor/app/modules/home/home_service.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<HomeService>(create: (_) => HomeService()),
          ProxyProvider<HomeService, HomeController>(update: (_, value, previous) => HomeController(value)),
          Provider<UserDao>(create: (_) => AppDatabase().userDao),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Slidy',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
