import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';

class ShowLicenseRequest extends StatelessWidget {
  final Function(bool hasLicenseNumber) onLicenseInfoProvided;

  const ShowLicenseRequest({required this.onLicenseInfoProvided, super.key});

  @override
  Widget build(BuildContext context) {
    final show = context.select<ShowFormCubit, Show?>(
      (cubit) => cubit.state.show,
    );

    if (show == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (show.showType == 'Schooling') {
      // If it's a schooling show, we skip this step.
      onLicenseInfoProvided(true);
      return Container(); // Or a placeholder that indicates automatic transition.
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'For ${show.competitionName} shows, a license number is required.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'The USA Working Equitation requires a license number request to be submitted at least 2 weeks before the show.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // User already has a license number
              onLicenseInfoProvided(true);
            },
            child: Text('I already have a license number'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // User needs to apply for a license number
              onLicenseInfoProvided(false);
            },
            child: Text('I need to apply for a license'),
          ),
        ],
      ),
    );
  }
}
