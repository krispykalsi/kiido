import 'package:flutter/widgets.dart';

const pageTransitionDuration = Duration(milliseconds: 180);

Widget slideTransitionBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.ease;
  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );
  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}
