import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/features/checklist/pages/checklist_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SADAMOV',
      theme: AppTheme.theme,
      home: ChecklistPage(),
    );
  }
}
