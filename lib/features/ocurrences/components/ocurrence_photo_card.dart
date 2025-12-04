import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class OcurrencePhotoCard extends StatelessWidget {
  const OcurrencePhotoCard({this.onTap, this.photoPath, super.key});

  final VoidCallback? onTap;

  final String? photoPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.photo96,
        height: AppDimensions.photo96,
        decoration: BoxDecoration(
          image: photoPath != null && photoPath!.isNotEmpty
              ? DecorationImage(
                  image: FileImage(File(photoPath!)),
                  fit: BoxFit.fill,
                )
              : null,
          color: photoPath != null && photoPath!.isNotEmpty
              ? Colors.transparent
              : AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(AppDimensions.radius8),
        ),
        padding: EdgeInsets.all(AppDimensions.spacing32),
        child: photoPath != null && photoPath!.isNotEmpty
            ? const SizedBox.shrink()
            : SvgPicture.asset(
                Assets.icons.cameraAdd,
                width: AppDimensions.icon32,
                height: AppDimensions.icon32,
              ),
      ),
    );
  }
}
