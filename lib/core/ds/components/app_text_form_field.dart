import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport_occurrence/core/ds/colors.dart';
import 'package:transport_occurrence/core/ds/dimensions.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.label,
    required this.hintText,
    this.validator,
    this.controller,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.readOnly = false,
    super.key,
  });

  final String label;

  final String hintText;

  final FormFieldValidator? validator;

  final TextEditingController? controller;

  final int? minLines;

  final int? maxLines;

  final List<TextInputFormatter>? inputFormatters;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.spacing4,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.textPrimary),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 1,
            readOnly: readOnly,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing20,
                vertical: AppDimensions.spacing12,
              ),
              labelStyle: Theme.of(context).textTheme.titleMedium,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius6),
                borderSide: BorderSide(color: AppColors.background, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius6),
                borderSide: BorderSide(color: AppColors.border, width: 1),
              ),
              hintText: hintText,
            ),
            validator: validator,
            inputFormatters: inputFormatters,
          ),
        ],
      ),
    );
  }
}
