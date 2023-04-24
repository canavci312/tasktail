import 'package:flutter/material.dart';

class TaskPropertySetTile extends StatelessWidget {
  const TaskPropertySetTile({
    super.key,
    required this.icon,
    this.iconColor,
    required this.content,
    this.onTap,
  });
  final IconData icon;
  final Color? iconColor;
  final Widget content;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
