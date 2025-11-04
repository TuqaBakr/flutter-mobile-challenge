import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? tooltip;
  Color? activeColor;

  CustomSwitchTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.tooltip, // fallback to your custom pink
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SwitchListTile(
            title: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                if (tooltip != null) ...[
                  const SizedBox(width: 8),
                  Tooltip(
                    message: tooltip!,
                    child: Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
