import 'package:flutter/material.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/Home/home_page.dart';
import 'package:working_equitation_manager/New%20Show/new_show_page.dart';
import 'package:working_equitation_manager/Show/show_page.dart';

class AppRoutes {
  final ObjectBox objectBox;

  AppRoutes({required this.objectBox});

  /// The route name for the home page.
  static const String home = '/';

  /// The route name for creating a new show.
  static const String newShow = '/newShow';

  /// The route name for managing a show.
  static const String show = '/show';

  /// A method that returns a map associating route names with widget builders.
  ///
  /// This method provides a way to pass `ObjectBox` to the necessary pages.
  Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomePage(objectBox: objectBox),
      newShow: (context) => NewShowPage(objectBox: objectBox),
    };
  }

  /// Define a route generator for handling dynamic navigation.
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case show:
        if (settings.arguments is Show) {
          final args = settings.arguments as Show;
          return MaterialPageRoute(
            builder: (context) => ShowPage(show: args, objectBox: objectBox),
          );
        }
        break;
      case newShow:
        return MaterialPageRoute(
          builder: (context) => NewShowPage(objectBox: objectBox),
        );
      default:
        // Fallback to HomePage if the route is not recognized.
        return MaterialPageRoute(
          builder: (context) => HomePage(objectBox: objectBox),
        );
    }
    // Default fallback to HomePage if conditions fail.
    return MaterialPageRoute(
      builder: (context) => HomePage(objectBox: objectBox),
    );
  }
}
