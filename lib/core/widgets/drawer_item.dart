import 'package:flutter/material.dart';

import '../utils/theme/colors_manager.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelected
                  ? ColorsManager.lightBlue
                  : ColorsManager.transparent,
            ),
            child: Icon(
              icon,
              color: isSelected ? ColorsManager.white : ColorsManager.black,
            ),
          ),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
