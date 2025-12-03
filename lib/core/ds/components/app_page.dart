import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/ds.dart';

class AppPage extends StatelessWidget with AppTheme, AppDimensions {
  const AppPage({
    required this.title,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = false,
    super.key,
  });

  final String title;

  final Widget? body;

  final Widget? bottomNavigationBar;

  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        leading: Navigator.canPop(context) ? AppBarLeading() : null,
        title: Text(title),
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
