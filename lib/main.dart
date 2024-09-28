import 'package:baca_mongo/menu/helper/theme_notifier.dart';
import 'package:baca_mongo/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

import 'CheckLoginScreen.dart';
import 'mongo/schema/all_schema.dart';
import 'mongo/service/mongo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('setting');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginRealm>(create: (BuildContext context) => LoginRealm()),
        ChangeNotifierProvider<DataService>(create: (_) => DataService()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: CheckLoginScreen(),
    );
  }
}
