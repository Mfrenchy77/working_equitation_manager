import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';

class ShowTypeSelection extends StatelessWidget {
  const ShowTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final cubit = context.read<ShowFormCubit>();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What type of show is this?',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              RadioListTile<ShowType>(
                selected: state.showType == ShowType.Schooling,
                title: const Text('Schooling Show'),
                value: ShowType.Schooling,
                groupValue: state.showType,
                onChanged: (ShowType? value) {
                  cubit.setShowType(value!);
                },
              ),
              RadioListTile<ShowType>(
                selected: state.showType == ShowType.Licensed,
                title: const Text('Licensed Show'),
                value: ShowType.Licensed,
                groupValue: state.showType,
                onChanged: (ShowType? value) {
                  cubit.setShowType(value!);
                },
              ),
              RadioListTile<ShowType>(
                selected: state.showType == ShowType.Championship,
                title: const Text('Championship'),
                value: ShowType.Championship,
                groupValue: state.showType,
                onChanged: (ShowType? value) {
                  cubit.setShowType(value!);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
