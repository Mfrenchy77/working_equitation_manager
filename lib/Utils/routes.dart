import 'package:flutter/material.dart';
import 'package:working_equitation_manager/Home/home_page.dart';
/// A class that defines the routes used in the application.
///
/// This class contains static constants for route names and a static map
/// that associates each route with its corresponding widget builder.
class AppRoutes {
  /// The route name for the home page.
  static const String home = '/';

  /// The route name for creating a new show.
  static const String newShow = '/newShow';

  /// The route name for managing a show.
  static const String show = '/manageShow';

  /// A map that associates route names with their corresponding widget builders.
  ///
  /// - `home`: Builds the `HomePage` widget.
  /// - `newShow`: Builds a `Placeholder` widget.
  /// - `show`: Builds a `Placeholder` widget.
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    newShow: (context) => const Placeholder(),
    show: (context) => const Placeholder(),
  };
}
