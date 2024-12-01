import 'package:flutter/material.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/Utils/routes.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();

  AppRoutes appRoutes = AppRoutes(objectBox: objectBox);
  runApp(MyApp(appRoutes: appRoutes));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;

  const MyApp({required this.appRoutes, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Working Equitation Show Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      routes: appRoutes.getRoutes(),
    );
  }
}
