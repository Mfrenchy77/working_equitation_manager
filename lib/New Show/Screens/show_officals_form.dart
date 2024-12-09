import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/offical.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/Utils/validator.dart';

class ShowOfficalsForm extends StatelessWidget {
  const ShowOfficalsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    OfficialRole? selectedRole;

    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final cubit = context.read<ShowFormCubit>();
        //create a list of other officials, includidng gate steward, show manager, show secretary, and other

        final List<Official> otherOfficials = [];
        if (state.gateSteward != null) {
          otherOfficials.add(state.gateSteward!);
        }
        if (state.showSecretary != null) {
          otherOfficials.add(state.showSecretary!);
        }
        if (state.showOrganizers.isNotEmpty) {
          otherOfficials.addAll(state.showOrganizers);
        }
        if (state.otherOfficials.isNotEmpty) {
          otherOfficials.addAll(state.otherOfficials);
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form to Add Official
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<OfficialRole>(
                        value: selectedRole,
                        decoration: const InputDecoration(
                          labelText: 'Official Role',
                        ),
                        items: OfficialRole.values
                            .map(
                              (role) => DropdownMenuItem(
                                value: role,
                                child: Text(role.name),
                              ),
                            )
                            .toList(),
                        onChanged: (role) {
                          selectedRole = role;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter the official’s name',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email (optional)',
                          hintText: 'Enter the official’s email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone (optional)',
                          hintText:
                              'Enter the official’s phone number with area code',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              !Validator.validateEmail(emailController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Please enter a valid email address',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (phoneController.text.isNotEmpty &&
                              Validator.validatePhoneNumber(
                                      phoneController.text) ==
                                  null) {
                            debugPrint('Text: ${phoneController.text}');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Please enter a 7 digit phone number',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (selectedRole != null &&
                              nameController.text.isNotEmpty) {
                            final official = Official(
                              name: nameController.text,
                              role: selectedRole!,
                              email: emailController.text,
                              phoneNumber: Validator.validatePhoneNumber(
                                  phoneController.text),
                            );
                            cubit.addOfficial(official);
                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            selectedRole = null;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Please choose a role and enter a name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Add Official'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Display Separate Lists for Each Role
              _buildOfficialsList(
                title: 'Judges',
                officials: state.judges,
                onDelete: (index) => cubit.removeOfficial(state.judges[index]),
              ),
              _buildOfficialsList(
                title: 'Technical Delegates',
                officials: state.technicalDelegates,
                onDelete: (index) =>
                    cubit.removeOfficial(state.technicalDelegates[index]),
              ),
              _buildOfficialsList(
                title: 'Other Officials',
                officials: otherOfficials,
                onDelete: (index) =>
                    cubit.removeOfficial(state.otherOfficials[index]),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildOfficialsList({
  required String title,
  required List<Official>? officials,
  required void Function(int index) onDelete,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (officials == null || officials.isEmpty)
            const Text('No officials added yet'),
          if (officials != null && officials.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: officials.length,
              itemBuilder: (context, index) {
                final official = officials[index];
                return ListTile(
                  title: Text(official.name),
                  subtitle: Text(
                    '${official.role.name} '
                    '${official.email != null ? '\nEmail: ${official.email}' : ''}'
                    ' ${official.phoneNumber != null ? '\nPhone: ${official.phoneNumber}' : ''}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDelete(index),
                  ),
                );
              },
            ),
        ],
      ),
    ),
  );
}
