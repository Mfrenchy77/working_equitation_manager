import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_license_request.dart';
import 'package:working_equitation_manager/New%20Show/Screens/show_type_selection.dart';

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
      create: (context) => ShowFormCubit(objectBox: objectBox),
      child: NewShowForm(),
    );
  }
}

class NewShowForm extends StatefulWidget {
  
  final Show? draftShow;

  const NewShowForm({
    super.key,
    this.draftShow,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NewShowFormState createState() => _NewShowFormState();
}

class _NewShowFormState extends State<NewShowForm> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Show'),
        leading: _currentPage == 0
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Prevent manual swiping
        children: [
          /// Step 1: Show Type Selection
          ShowTypeSelection(
            
            onShowTypeSelected: (showType) {
            context.read<ShowFormCubit>().setShowType(showType);
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }),

          /// Step 2: Show License Request
          ShowLicenseRequest(
            onLicenseInfoProvided: (bool hasLicenseNumber) {
              if (hasLicenseNumber) {
                // If the user has a license number, proceed to the next step
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                /// Collect the iformation needed to request a license number
              }
            },
          ),
          // Other steps can be added here as additional pages...
        ],
      ),
    );
  }
}
