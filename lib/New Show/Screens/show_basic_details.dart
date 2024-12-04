import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:intl/intl.dart';

class ShowBasicDetails extends StatelessWidget {
  const ShowBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateTimeController = TextEditingController();
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final cubit = context.read<ShowFormCubit>();
        debugPrint('Region number: ${state.regionNumber}');

        if (state.showDateAndStartTime != null) {
          String formattedDateTime = DateFormat('MMM dd yyyy HH:mm')
              .format(state.showDateAndStartTime!);
          dateTimeController.text = formattedDateTime;
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter the basic details of the competition',
                overflow: TextOverflow.visible,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) => cubit.saveShow,
                        initialValue: state.show?.competitionName ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: 'Competition Name',
                          hintText: 'Enter the name of the competition',
                        ),
                        onChanged: cubit.competitionNameChanged,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) => cubit.saveShow,
                        textCapitalization: TextCapitalization.words,
                        initialValue: state.show?.facilityName ?? '',
                        decoration: InputDecoration(
                            labelText: 'Facility Name',
                            hintText: 'Enter the name of the facility'),
                        onChanged: cubit.facilityNameChanged,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) => cubit.saveShow,
                        initialValue: state.facilityAddress,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            labelText: 'Facility Address',
                            hintText: 'Enter the address of the facility'),
                        onChanged: cubit.facilityAddressChanged,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        
                        validator: (value) {
                          // Check if the value is a number between 1 and 8
                          if (value == null || value.isEmpty) {
                            return null;
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          } else if (int.parse(value) < 1 ||
                              int.parse(value) > 8) {
                            return 'Please enter a number between 1 and 8';
                          } else {
                            return null;
                          }
                        },
                        onFieldSubmitted: (value) => cubit.saveShow,
                        keyboardType: TextInputType.number,
                        initialValue: state.regionNumber != null
                            ? state.regionNumber.toString()
                            : '',
                        decoration: InputDecoration(
                            labelText: 'Region Number',
                            hintText: 'Enter the region number'),
                        onChanged: (value) =>
                            cubit.regionNumberChanged(int.parse(value)),
                      ),
                      TextFormField(
                        controller: dateTimeController,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) => cubit.nextPage,
                        decoration: InputDecoration(
                          labelText: 'Show Date and Start Time',
                        ),
                        readOnly: true,
                        onTap: () async {
                          // Step 1: Pick a date
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate:
                                state.showDateAndStartTime ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            // Step 2: Pick a time
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  state.showDateAndStartTime ?? DateTime.now()),
                            );

                            if (pickedTime != null) {
                              // Combine the picked date and time into a single DateTime object
                              DateTime combinedDateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              String formattedDateTime =
                                  DateFormat('MMM dd yyyy HH:mm')
                                      .format(combinedDateTime);
                              dateTimeController.text = formattedDateTime;

                              // Update the cubit with the new DateTime
                              cubit.showDateAndStartTimeChanged(
                                  combinedDateTime);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
