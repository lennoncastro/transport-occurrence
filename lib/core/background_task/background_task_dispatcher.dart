import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:transport_occurrence/data/data.dart';
import 'package:transport_occurrence/data/data_module.dart';
import 'package:transport_occurrence/data/repositories/ocurrence_repository.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  debugPrint('callbackDispatcher: callbackDispatcher started');
  Modular.init(DataModule());
  final OcurrenceRepository ocurrenceRepository =
      Modular.get<OcurrenceRepository>();
  final OcurrenceService ocurrenceService = Modular.get<OcurrenceService>();
  Workmanager().executeTask((task, inputData) async {
    debugPrint(
      'callbackDispatcher: executeTask - task: $task, inputData: $inputData',
    );
    try {
      switch (task) {
        case 'send-ocurrences':
          await _handleSendOcurrences(
            task,
            ocurrenceRepository,
            ocurrenceService,
          );
          return _onSuccess(task);
        default:
          debugPrint('callbackDispatcher: unknown task - task: $task');
          return _onSuccess(task);
      }
    } catch (e, stackTrace) {
      return _onError(task, e, stackTrace);
    }
  });
}

Future<void> _handleSendOcurrences(
  String task,
  OcurrenceRepository ocurrenceRepository,
  OcurrenceService ocurrenceService,
) async {
  debugPrint('callbackDispatcher: [$task] Iniciando processamento');
  final ocurrences = await ocurrenceRepository.findNotProcessed();
  debugPrint(
    'callbackDispatcher: [$task] Occurrences found: ${ocurrences.length}',
  );
  for (final ocurrence in ocurrences) {
    try {
      await ocurrenceService.sendOcurrence(ocurrence);
      await ocurrenceRepository.markAsProcessed(ocurrence.id);
    } catch (e, stackTrace) {
      debugPrint(
        'callbackDispatcher: [$task] Error: $e\nStackTrace: $stackTrace',
      );
    }
  }
  debugPrint('callbackDispatcher: [$task] Processing completed');
}

Future<bool> _onSuccess(String task) {
  debugPrint('callbackDispatcher: [$task] Success');
  return Future.value(true);
}

Future<bool> _onError(String task, Object error, StackTrace stackTrace) {
  debugPrint(
    'callbackDispatcher: [$task] Error: $error\nStackTrace: $stackTrace',
  );
  return Future.error(error, stackTrace);
}
