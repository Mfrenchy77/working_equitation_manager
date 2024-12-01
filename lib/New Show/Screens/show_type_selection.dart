import 'package:flutter/material.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';

class ShowTypeSelection extends StatefulWidget {
  final Function(ShowType) onShowTypeSelected;
  final ShowType? selectedShowType;

  const ShowTypeSelection({
    required this.onShowTypeSelected,
    this.selectedShowType,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ShowTypeSelectionState createState() => _ShowTypeSelectionState();
}

class _ShowTypeSelectionState extends State<ShowTypeSelection> {
  ShowType? selectedShowType;

  @override
  void initState() {
    super.initState();
    selectedShowType = widget.selectedShowType;
  }

  @override
  Widget build(BuildContext context) {
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
            title: const Text('Schooling Show'),
            value: ShowType.Schooling,
            groupValue: selectedShowType,
            onChanged: (ShowType? value) {
              setState(() {
                selectedShowType = value;
              });
              widget.onShowTypeSelected(value!);
            },
          ),
          RadioListTile<ShowType>(
            title: const Text('Licensed Show'),
            value: ShowType.Licensed,
            groupValue: selectedShowType,
            onChanged: (ShowType? value) {
              setState(() {
                selectedShowType = value;
              });
              widget.onShowTypeSelected(value!);
            },
          ),
          RadioListTile<ShowType>(
            title: const Text('Championship'),
            value: ShowType.Championship,
            groupValue: selectedShowType,
            onChanged: (ShowType? value) {
              setState(() {
                selectedShowType = value;
              });
              widget.onShowTypeSelected(value!);
            },
          ),
        ],
      ),
    );
  }
}
