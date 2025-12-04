import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/extensions.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});

  final SuccessViewModel _viewModel = Modular.get<SuccessViewModel>();

  final SuccessStore _successStore = Modular.get<SuccessStore>();

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.successPage;
    return AppPage(
      title: labels.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: AppDimensions.spacing48,
          left: AppDimensions.spacing24,
          right: AppDimensions.spacing24,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.spacing2,
                  bottom: AppDimensions.spacing2,
                ),
                child: SvgPicture.asset(
                  Assets.icons.taskDone,
                  width: AppDimensions.icon64,
                  height: AppDimensions.icon64,
                ),
              ),
            ),
            SizedBox(height: AppDimensions.spacing16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.spacing4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AppDimensions.spacing4,
                children: [
                  Text(
                    labels.label,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(letterSpacing: -0.3),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    labels.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(height: 1.8),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.spacing14),
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.radius4),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing32,
                vertical: AppDimensions.spacing16,
              ),
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.spacing2,
                        ),
                        child: Text(
                          '${labels.services}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.spacing4,
                          top: AppDimensions.spacing2,
                          bottom: AppDimensions.spacing2,
                        ),
                        child: Text(
                          labels.ocurrence,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.spacing2,
                        ),
                        child: Text(
                          '${labels.responsible}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.spacing4,
                          top: AppDimensions.spacing2,
                          bottom: AppDimensions.spacing2,
                        ),
                        child: Observer(
                          builder: (_) => Text(
                            _successStore.responsible,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.spacing2,
                        ),
                        child: Text(
                          '${labels.dateTime}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.spacing4,
                          top: AppDimensions.spacing2,
                          bottom: AppDimensions.spacing2,
                        ),
                        child: Observer(
                          builder: (_) => RichText(
                            text: TextSpan(
                              text: '${_successStore.formattedDate} ',
                              style: Theme.of(context).textTheme.labelLarge,
                              children: [
                                TextSpan(
                                  text: '${labels.dateTimeAt} ',
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: _successStore.formattedTime,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.spacing2,
                        ),
                        child: Text(
                          '${labels.vehicle}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.spacing4,
                          top: AppDimensions.spacing2,
                          bottom: AppDimensions.spacing2,
                        ),
                        child: Observer(
                          builder: (_) => Text(
                            _successStore.plate,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacing24),
        child: AppElevatedButton(
          onPressed: _viewModel.backToHome,
          label: labels.form.buttonLabel,
        ),
      ),
    );
  }
}
