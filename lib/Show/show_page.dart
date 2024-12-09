import 'package:flutter/material.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';

class ShowPage extends StatelessWidget {
  static const String routeName = '/show';

  final Show? show;
  final ObjectBox objectBox;

  const ShowPage({
    this.show,
    required this.objectBox,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Page'),
      ),
      body: Center(
        child: Text('${show?.competitionName}'),
      ),
    );
  }
}
