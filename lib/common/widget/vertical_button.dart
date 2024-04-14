import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';

class ColumnButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  const ColumnButton({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium;
    final foregroundColor = theme.primaryColor;
    return InkWell(
      onTap: onPressed,
      splashFactory: InkSparkle.splashFactory,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32.0, color: foregroundColor),
            gap12,
            Text(
              title,
              style: style?.merge(
                TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),
              ),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
