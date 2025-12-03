import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ChecklistPage extends StatelessWidget with AppTheme, AppDimensions {
  const ChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? SizedBox(
                width: AppDimensions.icon24,
                height: AppDimensions.icon24,
                child: Center(
                  child: SvgPicture.asset(Assets.icons.roundArrowLeft),
                ),
              )
            : null,
        title: Text(context.labels.call().checklistPage.title),
      ),
      body: ListView.separated(
        itemCount: 1,
        padding: EdgeInsets.all(AppDimensions.spacing24),
        separatorBuilder: (context, index) =>
            SizedBox(height: AppDimensions.spacing16),
        itemBuilder: (context, index) {
          return Container(
            height: 80,
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
                      child: SvgPicture.asset(
                        Assets.icons.packagePlus,
                        width: AppDimensions.icon32,
                        height: AppDimensions.icon32,
                      ),
                    ),
                    Text(
                      context.labels.call().checklistPage.ocurrence,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xff515458),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: AppDimensions.icon24,
                  height: AppDimensions.icon24,
                  padding: EdgeInsets.all(3),
                  child: SvgPicture.asset(
                    Assets.icons.startLarge,
                    width: 6,
                    height: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
