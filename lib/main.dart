import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/app.dart';
import 'package:transport_occurrence/features/checklist/checklist_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: ChecklistModule(), child: const App()));
}
