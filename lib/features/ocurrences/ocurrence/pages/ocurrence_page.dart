import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrence/components/ocurrence_photo_card.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class OcurrencePage extends StatelessWidget with AppTheme {
  OcurrencePage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.ocurrencePage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.spacing24),
        child: Column(
          spacing: 16,
          children: [
            AppTextFormField(
              controller: controller,
              label: labels.form.label,
              hintText: labels.form.hintText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return labels.form.invalidInput;
                }
                return null;
              },
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 96),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 96,
                  mainAxisExtent: 96,
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return OcurrencePhotoCard();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing24),
        child: AppElevatedButton(
          label: labels.form.buttonLabel,
          icon: Padding(
            padding: EdgeInsets.only(top: AppDimensions.spacing2),
            child: SvgPicture.asset(
              Assets.icons.roundArrowRight,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
