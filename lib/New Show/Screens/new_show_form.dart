import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Home/home_page.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_basic_details.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_license_request.dart';
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
            pageController.jumpToPage(state.currentPage);

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
              title: Text(
                  state.show == null ? 'Create New Show' : 'Edit New Show'),
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

                ShowLicenseRequest(),
                // Additional steps can be added here
              ],
            ),
            floatingActionButton: ElevatedButton(
              onPressed:
                  // disable the next button when the required fields are not filled

                  cubit.isNextButtonEnabled()
                      ? () {
                          cubit.nextPage();
                        }
                      : null,
              child: const Text('Next'),
            ),
          ),
        );
      },
    );
  }
}
