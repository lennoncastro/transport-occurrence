import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:transport_occurrence/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('should show checklist page', (WidgetTester tester) async {
    // arrange
    app.main(isTest: true);
    await tester.pumpAndSettle();

    // assert
    expect(find.text('Checklist'), findsOneWidget);
    expect(find.text('Ocorrência'), findsOneWidget);

    // act
    await tester.tap(find.text('Ocorrência'));
    await tester.pumpAndSettle();

    // assert
    expect(find.text('Ocorrência'), findsOneWidget);
    expect(find.text('Placa Veículo'), findsOneWidget);
    expect(find.text('Placa'), findsOneWidget);
    expect(find.text('Avançar'), findsOneWidget);
  });
}
