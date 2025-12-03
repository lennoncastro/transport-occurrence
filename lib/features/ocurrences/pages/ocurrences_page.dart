import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class OcurrencesPage extends StatelessWidget with AppTheme {
  OcurrencesPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.ocurrencesPage;
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
                  return Container(
                    constraints: BoxConstraints(maxWidth: 96),
                    decoration: BoxDecoration(
                      color: Color(0XFFF6F6FB),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius8,
                      ),
                    ),
                    padding: EdgeInsets.all(AppDimensions.spacing32),
                    child: SvgPicture.asset(
                      Assets.icons.cameraAdd,
                      width: 32,
                      height: 32,
                    ),
                  );
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
