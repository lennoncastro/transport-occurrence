import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class SuccessPage extends StatelessWidget {
  SuccessPage({super.key});

  final controller = TextEditingController();

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
                  width: 64,
                  height: 64,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 4,
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
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF6F6FB),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${labels.services}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          top: 2,
                          bottom: 2,
                        ),
                        child: Text(
                          labels.services,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${labels.responsible}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          top: 2,
                          bottom: 2,
                        ),
                        child: Text(
                          'Filipe Benício da Conceição',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${labels.dateTime}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          top: 2,
                          bottom: 2,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '13/09/2024 ',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                              TextSpan(
                                text: 'às ',
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: '13/09/2024',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${labels.vehicle}:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          top: 2,
                          bottom: 2,
                        ),
                        child: Text(
                          'AAA-1A23',
                          style: Theme.of(context).textTheme.labelLarge,
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
        child: AppElevatedButton(label: labels.form.buttonLabel),
      ),
    );
  }
}
