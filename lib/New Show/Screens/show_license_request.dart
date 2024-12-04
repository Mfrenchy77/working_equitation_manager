import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';

class ShowLicenseRequest extends StatefulWidget {
  const ShowLicenseRequest({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShowLicenseRequestState createState() => _ShowLicenseRequestState();
}

class _ShowLicenseRequestState extends State<ShowLicenseRequest> {
  bool hasLicenseNumber = false;
  final TextEditingController licenseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final show = context.select<ShowFormCubit, Show?>(
      (cubit) => cubit.state.show,
    );

    if (show == null) {
      return Center(child: Text('No show details found'));
    }

    if (show.showType == ShowType.Schooling) {
// goto the next page
      context.read<ShowFormCubit>().nextPage();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Since ${show.competitionName ?? "the show"} '
              'is a ${show.showType?.name}, a license number is required.',
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
      
            // Buttons to choose whether the user has a license number or not
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hasLicenseNumber = true;
                });
                context.read<ShowFormCubit>().licenseNeededChanged(false);
              },
              child: Text('I already have a license number'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hasLicenseNumber = false;
                });
                context.read<ShowFormCubit>().licenseNeededChanged(true);
              },
              child: Text('I need to apply for a license'),
            ),
      
            // Conditional form field to input the license number if the user has one
            if (hasLicenseNumber) ...[
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: licenseNumberController,
                decoration: InputDecoration(
                  labelText: 'License Number',
                  hintText: 'Enter your license number',
                ),
                onChanged: (value) {
                  context.read<ShowFormCubit>().licenseNumberChanged(value);
                },
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
