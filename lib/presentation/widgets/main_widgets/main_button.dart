import 'package:flutter/material.dart';

/// The primary button widget used throughout the app.
///
/// Provides a consistent, customizable button with loading and icon support,
/// ensuring unified styling and interaction across all screens.
class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double width;
  final double height;
  final Color? color;
  final bool isLoading;
  final VoidCallback? onTap;
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.color,
    this.width = 120,
    this.height = 50,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: icon != null ? height : width,
        height: height,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child:
              isLoading
                  ? const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  )
                  : Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
        ),
      ),
    );
  }
}
