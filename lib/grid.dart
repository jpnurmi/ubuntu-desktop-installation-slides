import 'package:flutter/material.dart';

import 'settings.dart';

class LayoutGrid extends StatelessWidget {
  const LayoutGrid({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Settings.gridOf(context)) return const SizedBox.shrink();
    return IgnorePointer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < 25; ++i)
            Expanded(
              child: Container(
                color: i % 3 == 0
                    ? Colors.transparent
                    : Colors.green.withOpacity(0.1),
              ),
            ),
        ],
      ),
    );
  }
}
