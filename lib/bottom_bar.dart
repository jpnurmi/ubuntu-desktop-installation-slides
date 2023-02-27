import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.status,
    this.progress,
    this.onNext,
    this.onPrevious,
  });

  final String? status;
  final double? progress;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kYaruPagePadding),
      child: Row(
        children: [
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(YaruIcons.pan_start),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(YaruIcons.media_play),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: onNext,
            icon: const Icon(YaruIcons.pan_end),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(status ?? '')),
                    IconButton(
                      onPressed: () {},
                      iconSize: 16,
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(YaruIcons.terminal),
                    ),
                  ],
                ),
                LinearProgressIndicator(value: progress),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
