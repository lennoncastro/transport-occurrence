import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/app/app.dart';
import 'package:transport_occurrence/app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule(), child: const App()));
}
