import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class SignaturePage extends StatelessWidget with AppTheme {
  SignaturePage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.signaturePage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.spacing24),
        child: Column(
          spacing: 16,
          children: [
            AppTextFormField(
              controller: controller,
              label: labels.form.responsibleLabel,
              hintText: labels.form.responsibleHintText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return labels.form.responsibleInvalidInput;
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: controller,
              label: labels.form.signaturaLabel,
              hintText: labels.form.signaturaHintText,
              minLines: 4,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return labels.form.signaturaInvalidInput;
                }
                return null;
              },
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
              Assets.icons.checkCircle,
              width: 20,
              height: 20,
            ),
          ),
          iconPosition: AppElevatedButtonIconPosition.start,
        ),
      ),
    );
  }
}
