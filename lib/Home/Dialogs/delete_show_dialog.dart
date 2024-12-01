import 'package:flutter/material.dart';

AlertDialog deleteShowDialog(
    {required BuildContext context,
    required Function deleteShow,
    required int showId}) {
  return AlertDialog(
    title: Text('Delete Show'),
    content: Text('Are you sure you want to delete the show $showId?'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          deleteShow();
          Navigator.of(context).pop();
        },
        child: Text('Delete'),
      ),
    ],
  );
}
