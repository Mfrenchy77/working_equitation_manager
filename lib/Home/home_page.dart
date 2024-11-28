import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// Home page will have a our logo and then a button for New Show that will open up the new show setup page. and a list of shows that are saved.

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text('Hello World!'),
        ElevatedButton(
          onPressed: () {
            // Navigate to the New Show page
          },
          child: const Text('New Show'),
        ),
        ListView.builder(itemBuilder: 
          (BuildContext context, int index) {
            return  ListTile(
              title: Text('Show $index'),
            );
          },
        ),
      ],
    );
  }
}