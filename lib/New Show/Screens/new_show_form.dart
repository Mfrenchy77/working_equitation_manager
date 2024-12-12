import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Home/home_page.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/New%20Show/Screens/new_show_confirmation.dart';
import 'package:working_equitation_manager/New%20Show/Screens/new_show_levels.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_basic_details.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_license_request.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_officals_form.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_type_selection.dart';

class NewShowForm extends StatelessWidget {
  const NewShowForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        final pageController = PageController(initialPage: state.currentPage);
        final cubit = context.read<ShowFormCubit>();
        return BlocListener<ShowFormCubit, ShowFormState>(
          listenWhen: (previous, current) {
            return previous.currentPage != current.currentPage ||
                previous.isError != current.isError;
          },
          listener: (context, state) {
            final duration = Duration(milliseconds: 300);
            final curve = Curves.easeInOut;

            if (state.currentPage > pageController.page!) {
              // Forward transition
              pageController.animateToPage(
                state.currentPage,
                duration: duration,
                curve: curve,
              );
            } else {
              // Backward transition
              pageController.animateToPage(
                state.currentPage,
                duration: duration,
                curve: curve,
              );
            }
            // Show error message if there is an error
            if (state.isError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ),
                ).closed.then((value) {
                  if (!context.mounted) return;
                  cubit.clearError();
                });
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const _NewShowFormText(),
              leading: state.currentPage == 0
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        cubit.saveShow();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomePage.routeName,
                          (Route<dynamic> route) => false,
                        );
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        cubit.previousPage();
                      },
                    ),
            ),
            body: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                debugPrint('Page changed to: $index');

                // cubit.setPage(index);
              },
              children: [
                ShowBasicDetails(),
                ShowTypeSelection(),
                NewShowLevels(),
                ShowLicenseRequest(),
                ShowOfficalsForm(),
                ShowConfirmation(),
              ],
            ),
            floatingActionButton: Visibility(
              visible: state.currentPage != 5,
              child: ElevatedButton(
                onPressed: cubit.isNextButtonEnabled() ? cubit.nextPage : null,
                child: Text('Next'),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NewShowFormText extends StatelessWidget {
  const _NewShowFormText();
  //based on the current page, the text will change
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFormCubit, ShowFormState>(
      builder: (context, state) {
        switch (state.currentPage) {
          case 0:
            return const Text('Basic Details');
          case 1:
            return const Text('Show Type');
          case 2:
            return const Text('Levels Offered');

          case 3:
            return const Text('License Request');
          case 4:
            return const Text('Add Officials');
          case 5:
            return const Text('Confirmation');
          default:
            return const Text('Unknown');
        }
      },
    );
  }
}
