import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signature/signature.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/features/ocurrences/stores/manual_signature_store.dart';
import 'package:transport_occurrence/features/ocurrences/viewmodels/manual_signature_viewmodel.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ManualSignaturePage extends StatefulWidget {
  const ManualSignaturePage({super.key});

  @override
  State<ManualSignaturePage> createState() => _ManualSignaturePageState();
}

class _ManualSignaturePageState extends State<ManualSignaturePage> {
  final ManualSignatureViewModel _viewModel =
      Modular.get<ManualSignatureViewModel>();

  final ManualSignatureStore _manualSignatureStore =
      Modular.get<ManualSignatureStore>();

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: AppColors.black,
    exportBackgroundColor: AppColors.white,
  );

  Timer? _signatureTimerDebouncer;

  @override
  void initState() {
    super.initState();
    _signatureController.addListener(() {
      if (!mounted) return;
      if (_signatureTimerDebouncer != null) {
        _signatureTimerDebouncer?.cancel();
      }
      _signatureTimerDebouncer = Timer(const Duration(milliseconds: 1000), () {
        _signatureController.toPngBytes().then(_viewModel.setSignature);
      });
    });
  }

  @override
  void dispose() {
    _signatureController.dispose();
    _signatureTimerDebouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.manualSignaturePage;
    return AppPage(
      title: labels.title,
      body: Padding(
        padding: EdgeInsets.all(AppDimensions.spacing24),
        child: Stack(
          children: [
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: _signatureController.clear,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppDimensions.spacing2,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.erasersQuare,
                      width: AppDimensions.icon24,
                      height: AppDimensions.icon24,
                    ),
                    Text(
                      labels.clear,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 155,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.black,
                        width: AppDimensions.spacing2,
                      ),
                    ),
                  ),
                  child: Signature(
                    controller: _signatureController,
                    backgroundColor: Colors.transparent,
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
            onPressed: _manualSignatureStore.isButtonEnabled
                ? _viewModel.submit
                : null,
            label: labels.buttonLabel,
            icon: Padding(
              padding: EdgeInsets.only(top: AppDimensions.spacing2),
              child: SvgPicture.asset(
                Assets.icons.pen,
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
