import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:intl/intl.dart';
import 'package:working_equitation_manager/Utils/constants.dart';

class ShowBasicDetails extends StatelessWidget {
  const ShowBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController startDateTimeController =
        TextEditingController();
    final TextEditingController endDateTimeController = TextEditingController();
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final cubit = context.read<ShowFormCubit>();

        if (state.showStartDateAndStartTime != null) {
          String formattedDateTime = DateFormat('MMM dd yyyy HH:mm')
              .format(state.showStartDateAndStartTime!);
          startDateTimeController.text = formattedDateTime;
        }

        if (state.showEndDateAndEndTime != null) {
          String formattedDateTime = DateFormat('MMM dd yyyy HH:mm')
              .format(state.showEndDateAndEndTime!);
          endDateTimeController.text = formattedDateTime;
        }

        return SingleChildScrollView(
          child: Center(
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
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) => cubit.saveShow(),
                          initialValue: state.show?.competitionName ?? '',
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Competition Name',
                            hintText: 'Enter the name of the competition',
                          ),
                          onChanged: cubit.competitionNameChanged,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) => cubit.saveShow(),
                          textCapitalization: TextCapitalization.words,
                          initialValue: state.show?.facilityName ?? '',
                          decoration: InputDecoration(
                            labelText: 'Facility Name',
                            hintText: 'Enter the name of the facility',
                          ),
                          onChanged: cubit.facilityNameChanged,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) => cubit.saveShow(),
                          initialValue: state.facilityAddress,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            labelText: 'Facility Address',
                            hintText: 'Enter the address of the facility',
                          ),
                          onChanged: cubit.facilityAddressChanged,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: cubit.facilityCityChanged,
                          initialValue: state.facilityCity,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Facility City',
                            hintText: 'Enter the city of the facility',
                          ),
                          onChanged: cubit.facilityCityChanged,
                        ),
                        // Dropdown for State
                        DropdownButtonFormField<String>(
                          value: state.facilityState,
                          hint: Text('Select State'),
                          items: Constants.states.map((String state) {
                            return DropdownMenuItem(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (value) {
                            cubit.facilityStateChanged(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Facility State',
                          ),
                        ),
                        // Dropdown for Region
                        DropdownButtonFormField<int>(
                          value: state.regionNumber,
                          hint: Text('Select Region'),
                          items: Constants.regionConstants.keys
                              .map((regionNumber) {
                            return DropdownMenuItem(
                              value: regionNumber,
                              child: Text('Region $regionNumber'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              cubit.regionNumberChanged(value);
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Region',
                          ),
                        ),
                        TextFormField(
                          controller: startDateTimeController,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) => cubit.nextPage(),
                          decoration: InputDecoration(
                            labelText: 'Show Start Date and Start Time',
                          ),
                          readOnly: true,
                          onTap: () async {
                            // Step 1: Pick a date
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: state.showStartDateAndStartTime ??
                                  DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              // Step 2: Pick a time
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    state.showStartDateAndStartTime ??
                                        DateTime.now()),
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
                                startDateTimeController.text =
                                    formattedDateTime;

                                // Update the cubit with the new DateTime
                                cubit.showStartDateAndStartTimeChanged(
                                    combinedDateTime);
                              }
                            }
                          },
                        ),
                        // End of Show Date and End Time
                        TextFormField(
                          controller: endDateTimeController,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) => cubit.nextPage(),
                          decoration: InputDecoration(
                            labelText: 'Show End Date and End Time',
                          ),
                          readOnly: true,
                          onTap: () async {
                            // Step 1: Pick a date
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate:
                                  state.showEndDateAndEndTime ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              // Step 2: Pick a time
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    state.showEndDateAndEndTime ??
                                        DateTime.now()),
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
                                endDateTimeController.text = formattedDateTime;
                                // Update the cubit with the new DateTime
                                cubit.showEndDateAndEndTimeChanged(
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
          ),
        );
      },
    );
  }
}
