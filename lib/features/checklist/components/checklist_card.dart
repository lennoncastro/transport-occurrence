import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ChecklistCard extends StatelessWidget with AppTheme, AppDimensions {
  const ChecklistCard({
    required this.label,
    required this.icon,
    this.onTap,
    super.key,
  });

  final String label;

  final Widget icon;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimensions.cardHeight80,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radius8),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0D000000),
              offset: const Offset(0, 2),
              blurRadius: AppDimensions.radius6,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.spacing24,
          vertical: AppDimensions.spacing16,
        ),
        child: Row(
          spacing: AppDimensions.spacing16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AppDimensions.spacing16,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6FB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.radius8),
                    ),
                  ),
                  padding: EdgeInsets.all(AppDimensions.spacing8),
                  child: icon,
                ),
                Text(
                  label,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Color(0xff515458)),
                ),
              ],
            ),
            Container(
              width: AppDimensions.icon24,
              height: AppDimensions.icon24,
              padding: EdgeInsets.all(AppDimensions.spacing3),
              child: SvgPicture.asset(
                Assets.icons.startLarge,
                width: 6,
                height: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
