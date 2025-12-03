import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.label,
    this.icon,
    this.onPressed,
    super.key,
  });

  final String label;

  final Widget? icon;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      child: SizedBox(
        height: 48,
        child: Row(
          spacing: AppDimensions.spacing10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(label), icon ?? const SizedBox.shrink()],
        ),
      ),
    );
  }
}
