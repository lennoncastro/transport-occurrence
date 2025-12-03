import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:transport_occurrence/core/ds/components/app_bar_leading.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';

class OcurrencesPage extends StatelessWidget with AppTheme, AppDimensions {
  const OcurrencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ? AppBarLeading() : null,
        title: Text(context.labels.call().ocurrencesPage.title),
      ),
    );
  }
}
