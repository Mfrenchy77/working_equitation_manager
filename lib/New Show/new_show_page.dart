import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/New%20Show/Screens/new_show_form.dart';

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
    // this is showing null
    debugPrint('Draft show in newShowPage: ${draftShow?.competitionName}');
    return BlocProvider(
      create: (context) => ShowFormCubit(
        objectBox: objectBox,
        draftShow: draftShow,
      ),
      child: NewShowForm(),
    );
  }
}

// class NewShowForm extends StatefulWidget {
//   final Show? draftShow;

//   const NewShowForm({
//     super.key,
//     this.draftShow,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _NewShowFormState createState() => _NewShowFormState();
// }

// class _NewShowFormState extends State<NewShowForm> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController();
//   ShowType? selectedShowType;

//   @override
//   void initState() {
//     super.initState();
//     selectedShowType = widget.draftShow?.showType;
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page?.round() ?? 0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create New Show'),
//         leading: _currentPage == 0
//             ? IconButton(
//                 icon: Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             : IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   _pageController.previousPage(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeIn,
//                   );
//                 },
//               ),
//       ),
//       body: PageView(
//         controller: _pageController,
//         physics: NeverScrollableScrollPhysics(), // Prevent manual swiping
//         children: [
//           /// Step 1: Show Type Selection
//           ShowTypeSelection(
//               selectedShowType: widget.draftShow?.showType,
//               onShowTypeSelected: (showType) {
//                 context.read<ShowFormCubit>().setShowType(showType);
//                 _pageController.nextPage(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeIn,
//                 );
//               }),

//           /// Step 2: Show License Request
//           ShowLicenseRequest(
//             onLicenseInfoProvided: (bool hasLicenseNumber) {
//               if (hasLicenseNumber) {
//                 // If the user has a license number, proceed to the next step
//                 _pageController.nextPage(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeIn,
//                 );
//               } else {
//                 /// Collect the iformation needed to request a license number
//               }
//             },
//           ),
//           // Other steps can be added here as additional pages...
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed:_ () {},
//         label: Text('Next'),
//       ),
//     );
//   }

//   bool _isNextButtonEnabled(ShowFormState state) {
//     // Enable the "Next" button only if ShowType is selected
//     if (_currentPage == 0) {
//       return state.show?.showType != null;
//     }
//     return true;
//   }
// }
