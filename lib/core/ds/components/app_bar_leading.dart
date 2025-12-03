import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class AppBarLeading extends StatelessWidget with AppTheme, AppDimensions {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.icon24,
      height: AppDimensions.icon24,
      child: Center(child: SvgPicture.asset(Assets.icons.roundArrowLeft)),
    );
  }
}
