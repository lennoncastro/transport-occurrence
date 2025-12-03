import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/features/checklist/components/checklist_card.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ChecklistPage extends StatelessWidget {
  ChecklistPage({super.key});

  final NavigationService _navigationService = Modular.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: context.labels.checklistPage.title,
      body: ListView.separated(
        itemCount: 1,
        padding: EdgeInsets.all(AppDimensions.spacing24),
        separatorBuilder: (context, index) =>
            SizedBox(height: AppDimensions.spacing16),
        itemBuilder: (context, index) {
          return ChecklistCard(
            onTap: _navigationService.goToOccurrences,
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
