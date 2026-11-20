import 'package:flutter/material.dart';

double accessibleIconSize(BuildContext context, double baseSize) {
  final textScale = MediaQuery.textScalerOf(context).scale(1.0);
  return baseSize * textScale;
}
