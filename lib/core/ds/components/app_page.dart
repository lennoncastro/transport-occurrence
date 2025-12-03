import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';

class AppPage extends StatelessWidget with AppTheme, AppDimensions {
  const AppPage({required this.title, this.body, super.key});

  final String title;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ? AppBarLeading() : null,
        title: Text(title),
      ),
      body: body,
    );
  }
}
