import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';

class NewShowLevels extends StatelessWidget {
  const NewShowLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final cubit = context.read<ShowFormCubit>();
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Levels Offered and Cattle Trial',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Levels Offered Section
              const Text(
                'Levels Offered (Select all that apply):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: List.generate(
                  7,
                  (index) {
                    final level = 'L${index + 1}';
                    return CheckboxListTile(
                      title: Text(level),
                      value: state.levelsOffered?.contains(index + 1) ?? false,
                      onChanged: (isSelected) {
                        List<int> updatedLevels =
                            List<int>.from(state.levelsOffered ?? []);
                        if (isSelected == true) {
                          updatedLevels.add(index + 1);
                        } else {
                          updatedLevels.remove(index + 1);
                        }
                        cubit.levelsOfferedChanged(updatedLevels);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Cattle Trial Section
              const Text(
                'Is a Cattle Trial Offered?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: const Text('Cattle Trial Offered'),
                value: state.cattleTrialOffered,
                onChanged: cubit.cattleTrialOfferedChanged,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
