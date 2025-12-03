import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';

class OcurrencesPage extends StatelessWidget with AppTheme, AppDimensions {
  OcurrencesPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.ocurrencesPage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
