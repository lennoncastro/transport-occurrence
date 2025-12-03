import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/ocurrences/pages/ocurrences_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.labels.app.title,
      theme: AppTheme.theme,
      home: OcurrencesPage(),
    );
  }
}
