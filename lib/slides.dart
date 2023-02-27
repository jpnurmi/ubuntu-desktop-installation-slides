import 'package:flutter/material.dart';

class SlideLayout0 extends StatelessWidget {
  const SlideLayout0({
    super.key,
    required this.tagline,
    required this.introduction,
  });

  final String tagline;
  final String introduction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Text(
                      tagline,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(introduction),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              const Expanded(
                flex: 8,
                child: SizedBox(
                  height: 240,
                  child: Placeholder(),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
