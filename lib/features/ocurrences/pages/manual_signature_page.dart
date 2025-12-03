import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signature/signature.dart';
import 'package:transport_occurrence/core/ds/ds.dart';
import 'package:transport_occurrence/core/extensions/labels.dart';
import 'package:transport_occurrence/gen/assets.gen.dart';

class ManualSignaturePage extends StatefulWidget {
  const ManualSignaturePage({super.key});

  @override
  State<ManualSignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<ManualSignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.labels.manualSignaturePage;
    return AppPage(
      title: labels.title,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: _controller.clear,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 2,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.erasersQuare,
                      width: 24,
                      height: 24,
                    ),
                    Text(
                      labels.clear,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Color(0xFF000000)),
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
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFF000000), width: 2),
                    ),
                  ),
                  child: Signature(
                    controller: _controller,
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
        child: AppElevatedButton(
          label: labels.buttonLabel,
          icon: Padding(
            padding: EdgeInsets.only(top: AppDimensions.spacing2),
            child: SvgPicture.asset(Assets.icons.pen, width: 20, height: 20),
          ),
          iconPosition: AppElevatedButtonIconPosition.start,
        ),
      ),
    );
  }
}
