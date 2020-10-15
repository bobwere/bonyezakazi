import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget fadeThrough(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child);
}
