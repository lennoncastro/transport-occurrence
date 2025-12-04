import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/ocurrences/stores/signature_store.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/signature_viewmodel.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureViewModel _viewModel = Modular.get<SignatureViewModel>();

  final SignatureStore _signatureStore = Modular.get<SignatureStore>();

  final _responsibleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _responsibleController.addListener(() {
      if (!mounted) return;
      _signatureStore.setResponsible(_responsibleController.text);
    });
  }

  @override
  void dispose() {
    _responsibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.signaturePage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.spacing24),
        child: Column(
          spacing: AppDimensions.spacing16,
          children: [
            AppTextFormField(
              key: Key(labels.form.responsibleLabel.toLowerCase()),
              controller: _responsibleController,
              label: labels.form.responsibleLabel,
              hintText: labels.form.responsibleHintText,
            ),
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: _viewModel.takeSignature,
              child: AbsorbPointer(
                absorbing: true,
                child: Observer(
                  builder: (_) => Stack(
                    children: [
                      if (_signatureStore.signaturePath.isNotEmpty)
                        Positioned.fill(
                          child: Image.file(
                            File(_signatureStore.signaturePath),
                          ),
                        ),
                      AppTextFormField(
                        key: Key(labels.form.signaturaLabel.toLowerCase()),
                        label: labels.form.signaturaLabel,
                        hintText: _signatureStore.signaturePath.isEmpty
                            ? labels.form.signaturaHintText
                            : '',
                        minLines: 4,
                        maxLines: 4,
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing24),
        child: Observer(
          builder: (_) => AppElevatedButton(
            onPressed: _signatureStore.isButtonEnabled
                ? _viewModel.submit
                : null,
            label: labels.form.buttonLabel,
            icon: Padding(
              padding: EdgeInsets.only(top: AppDimensions.spacing2),
              child: SvgPicture.asset(
                Assets.icons.checkCircle,
                width: AppDimensions.icon20,
                height: AppDimensions.icon20,
              ),
            ),
            iconPosition: AppElevatedButtonIconPosition.start,
          ),
        ),
      ),
    );
  }
}
