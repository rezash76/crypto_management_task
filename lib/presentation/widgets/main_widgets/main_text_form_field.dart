import 'package:flutter/material.dart';

/// The primary text form field widget used throughout the app.
///
/// This customizable input field standardizes text entry UI across all forms and screens,
/// ensuring consistent styling, validation, and user experience in the application.
class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.enabled,
    this.autofocus = false,
    this.hintText,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.suffixIcon,
    this.floatingLabelBehavior,
    this.obscureText = false,
    this.width,
    this.height,
    this.validator,
  });

  final TextEditingController controller;
  final String? labelText;
  final bool? enabled;
  final bool autofocus;
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool obscureText;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        autofocus: autofocus,
        enabled: enabled,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        style: textTheme.titleMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          suffixIcon: suffixIcon,
          labelStyle: textTheme.titleMedium,
          floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.primaryContainer),
          ),
          errorStyle: textTheme.titleMedium!.copyWith(color: colorScheme.error),
        ),
        validator: validator,
      ),
    );
  }
}
