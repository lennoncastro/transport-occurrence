import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';

class OcurrencesPage extends StatelessWidget with AppTheme, AppDimensions {
  const OcurrencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(title: context.labels.ocurrencesPage.title);
  }
}
