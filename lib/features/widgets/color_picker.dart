import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});
  static Future<TagColor?> show(BuildContext context) async {
    return showModalBottomSheet<TagColor?>(
      context: context,
      builder: (context) => const ColorPicker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context, TagColor.noColor),
                  child: const Icon(
                    Icons.format_color_reset_outlined,
                    size: 50,
                  ),
                ),
                for (final color in TagColor.values)
                  if (color != TagColor.noColor)
                    GestureDetector(
                      onTap: () => Navigator.pop(context, color),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color.toColor(),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
