import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';

enum AppElevatedButtonIconPosition { start, end }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.label,
    this.icon,
    this.onPressed,
    this.iconPosition = AppElevatedButtonIconPosition.end,
    super.key,
  });

  final String label;

  final Widget? icon;

  final VoidCallback? onPressed;

  final AppElevatedButtonIconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 48,
        child: Row(
          spacing: AppDimensions.spacing10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconPosition == AppElevatedButtonIconPosition.end) ...[
              Text(label),
              icon ?? const SizedBox.shrink(),
            ] else ...[
              icon ?? const SizedBox.shrink(),
              Text(label),
            ],
          ],
        ),
      ),
    );
  }
}
