import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double width;
  final double height;
  final Color color;
  final bool isLoading;
  final VoidCallback? onTap;
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.color = const Color.fromARGB(255, 26, 86, 207),
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
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child:
              isLoading
                  ? const CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  )
                  : icon == null
                  ? Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  : Icon(icon!, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
