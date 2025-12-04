import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/ocurrences/components/ocurrence_photo_card.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/ocurrence_viewmodel.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class OcurrencePage extends StatefulWidget {
  const OcurrencePage({super.key});

  @override
  State<OcurrencePage> createState() => _OcurrencePageState();
}

class _OcurrencePageState extends State<OcurrencePage> {
  final _plateController = TextEditingController();

  final OcurrenceViewModel _viewModel = Modular.get<OcurrenceViewModel>();

  final OcurrenceStore _store = Modular.get<OcurrenceStore>();

  final _plateMaskFormatter = MaskTextInputFormatter(
    mask: 'AAA-####',
    filter: {'A': RegExp(r'[A-Za-z]'), '#': RegExp(r'[A-Za-z0-9]')},
  );

  @override
  void initState() {
    super.initState();
    _plateController.addListener(() {
      debugPrint(
        'plate: ${_plateMaskFormatter.getUnmaskedText().toUpperCase()}',
      );
      _store.setPlate(_plateMaskFormatter.getUnmaskedText().toUpperCase());
    });
  }

  @override
  void dispose() {
    _plateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.ocurrencePage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.spacing24),
        child: Column(
          spacing: 16,
          children: [
            AppTextFormField(
              label: labels.form.label,
              hintText: labels.form.hintText,
              inputFormatters: [_plateMaskFormatter],
              controller: _plateController,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 96),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 96,
                  mainAxisExtent: 96,
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return OcurrencePhotoCard(onTap: _viewModel.takePhoto);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing24),
        child: Observer(
          builder: (_) => AppElevatedButton(
            onPressed: _store.isButtonEnabled ? _viewModel.submit : null,
            label: labels.form.buttonLabel,
            icon: Padding(
              padding: EdgeInsets.only(top: AppDimensions.spacing2),
              child: SvgPicture.asset(
                _store.isButtonEnabled
                    ? Assets.icons.roundArrowRight
                    : Assets.icons.roundArrowRightDisabled,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
