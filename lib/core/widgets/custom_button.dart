import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/theme/colors_manager.dart';
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double fontSize;
  final bool showIcon;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.fontSize,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor.withAlpha(200),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: Text(
            label,
            style: theme.textTheme.displayLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cormorant',
              color: ColorsManager.white,
            ),
          ),
        ),

        if (showIcon)
          Positioned(
            top: -33,
            left: -27,
            child: Image.asset(
              AppAssets.designButtonIcon,
              color: theme.colorScheme.primary,
              height: 90,
              width: 80,
              fit: BoxFit.contain,
            ),
          ),
      ],
    );
  }
}
