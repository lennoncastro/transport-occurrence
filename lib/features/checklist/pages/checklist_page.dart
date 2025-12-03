import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/components/app_bar_leading.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/checklist/components/checklist_card.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ChecklistPage extends StatelessWidget with AppTheme, AppDimensions {
  const ChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ? AppBarLeading() : null,
        title: Text(context.labels.checklistPage.title),
      ),
      body: ListView.separated(
        itemCount: 1,
        padding: EdgeInsets.all(AppDimensions.spacing24),
        separatorBuilder: (context, index) =>
            SizedBox(height: AppDimensions.spacing16),
        itemBuilder: (context, index) {
          return ChecklistCard(
            icon: SvgPicture.asset(
              Assets.icons.packagePlus,
              width: AppDimensions.icon32,
              height: AppDimensions.icon32,
            ),
            label: context.labels.checklistPage.ocurrence,
          );
        },
      ),
    );
  }
}
