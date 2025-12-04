import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';
import 'package:transport_occurrence/main.dart' as app;

import 'utils/test_image_helper.dart';

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

    // act
    await tester.enterText(find.byType(TextFormField), 'ABC-1234');
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    // arrange
    final testPhotoPath = await createFakeImageFile();
    Modular.get<OcurrenceStore>().setPhotoPath(testPhotoPath);

    // act
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(milliseconds: 1600));
    await tester.tap(find.text('Avançar'));
    await tester.pumpAndSettle();

    // assert
    expect(find.text('Assinatura'), findsNWidgets(3));
    expect(find.text('Responsável'), findsNWidgets(2));
    expect(find.text('Finalizar'), findsOneWidget);

    // act
    await tester.enterText(find.byType(TextFormField).first, 'João Jose');
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    Modular.get<OcurrenceStore>().setSignaturePath(testPhotoPath);
    await tester.pumpAndSettle(Duration(milliseconds: 1600));
    await tester.tap(find.text('Finalizar'));
    await tester.pumpAndSettle();

    // assert
    expect(find.text('Concluído'), findsOneWidget);
    expect(find.text('Registrado'), findsOneWidget);
    expect(
      find.text(
        'Ocorrência registrada com sucesso.\nOs seguintes dados foram gravados',
      ),
      findsOneWidget,
    );
    expect(find.text('Serviços:'), findsOneWidget);
    expect(find.text('Ocorrência'), findsOneWidget);
    expect(find.text('Responsável:'), findsOneWidget);
    expect(find.text('João Jose'), findsOneWidget);
    expect(find.text('Data e hora:'), findsOneWidget);
    expect(find.text('Veículo:'), findsOneWidget);
    expect(find.text('ABC-1234'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
  });
}
