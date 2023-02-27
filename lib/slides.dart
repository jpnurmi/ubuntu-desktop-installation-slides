import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
                child: Placeholder(),
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

class SlideLayout1 extends StatelessWidget {
  const SlideLayout1({
    super.key,
    required this.tagline,
    required this.introduction,
    required this.rows,
  });

  final String tagline;
  final String introduction;
  final List<TableRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: kYaruTitleBarHeight + 8),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 8,
                child: Text(
                  tagline,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(introduction),
                    const SizedBox(height: 16),
                    const Expanded(child: Placeholder()),
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder(
                        horizontalInside: Divider.createBorderSide(context),
                      ),
                      columnWidths: const {0: IntrinsicColumnWidth()},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: rows,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        const SizedBox(height: kYaruTitleBarHeight + kYaruPagePadding),
      ],
    );
  }
}

class SlideLayout2 extends StatelessWidget {
  const SlideLayout2({
    super.key,
    required this.tagline,
    required this.introduction,
    required this.rows,
  });

  final String tagline;
  final String introduction;
  final List<TableRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: kYaruTitleBarHeight + 8),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              const Expanded(
                flex: 8,
                child: Placeholder(),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 1),
                    Text(
                      tagline,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(introduction),
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder(
                        horizontalInside: Divider.createBorderSide(context),
                      ),
                      columnWidths: const {0: IntrinsicColumnWidth()},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: rows,
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        const SizedBox(height: kYaruTitleBarHeight + kYaruPagePadding + 40),
      ],
    );
  }
}
