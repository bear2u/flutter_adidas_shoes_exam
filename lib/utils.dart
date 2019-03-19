import 'package:flutter/material.dart';

double baseHeight = 640.0;

double screenAwareSize(double size, BuildContext context) {
  final s = size * MediaQuery.of(context).size.height / baseHeight;
  print('$s, ${MediaQuery.of(context).size.height}, $baseHeight');
  return s;
}