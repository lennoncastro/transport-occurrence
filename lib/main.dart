import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/app/app.dart';
import 'package:transport_occurrence/app/app_module.dart';
import 'package:transport_occurrence/core/background_task/background_task.dart';
import 'package:workmanager/workmanager.dart';

void main({bool isTest = false}) {
  WidgetsFlutterBinding.ensureInitialized();
  if (!isTest) {
    Workmanager()
      ..initialize(callbackDispatcher)
      ..registerPeriodicTask(
        "send-ocurrences",
        "send-ocurrences",
        frequency: Duration(minutes: 5),
      );
  }
  runApp(ModularApp(module: AppModule(), child: const App()));
}
