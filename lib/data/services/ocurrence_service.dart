import 'package:transport_occurrence/core/network/network.dart';
import 'package:transport_occurrence/data/data.dart';

abstract interface class OcurrenceService {
  Future<void> sendOcurrence(Ocurrence ocurrence);
}

class OcurrenceServiceImpl implements OcurrenceService {
  OcurrenceServiceImpl(this._httpClient);

  final HttpClient _httpClient;

  @override
  Future<void> sendOcurrence(Ocurrence ocurrence) async {
    try {
      final body = await ocurrence.toHttpJson();
      await _httpClient.post('/ocurrences', body);
    } catch (e) {
      throw OcurrenceException.syncFailed(
        message: 'Erro ao enviar ocorrência: ${e.toString()}',
        ocurrenceId: ocurrence.id,
        originalException: e,
      );
    }
  }
}
