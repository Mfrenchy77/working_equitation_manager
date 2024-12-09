import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/New%20Show/Screens/new_show_form.dart';

class NewShowPage extends StatelessWidget {
  static const routeName = '/newShow';

  final Show? draftShow;
  final ObjectBox objectBox;

  const NewShowPage({
    super.key,
    this.draftShow,
    required this.objectBox,
  });

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => ShowFormCubit(
        objectBox: objectBox,
        draftShow: draftShow,
      ),
      child: NewShowForm(),
    );
  }
}
