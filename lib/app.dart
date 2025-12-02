import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';

class App extends StatelessWidget with AppTheme {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SADAMOV', theme: AppTheme.theme);
  }
}
