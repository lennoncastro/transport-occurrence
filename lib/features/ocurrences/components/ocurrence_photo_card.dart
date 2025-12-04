import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class OcurrencePhotoCard extends StatelessWidget {
  const OcurrencePhotoCard({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 96),
        decoration: BoxDecoration(
          color: Color(0XFFF6F6FB),
          borderRadius: BorderRadius.circular(AppDimensions.radius8),
        ),
        padding: EdgeInsets.all(AppDimensions.spacing32),
        child: SvgPicture.asset(Assets.icons.cameraAdd, width: 32, height: 32),
      ),
    );
  }
}
