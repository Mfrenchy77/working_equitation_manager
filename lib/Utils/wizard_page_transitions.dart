import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  final bool isForward;

  PageTransition({required this.page, this.isForward = true})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const beginOffsetForward = Offset(1.0, 0.0); // From the right
            const beginOffsetBackward = Offset(-1.0, 0.0); // From the left
            const endOffset = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween<Offset>(
              begin: isForward ? beginOffsetForward : beginOffsetBackward,
              end: endOffset,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
