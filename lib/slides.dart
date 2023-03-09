import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SlideLayout0 extends StatelessWidget {
  const SlideLayout0({
    super.key,
    required this.title,
    required this.body,
  });

  final Widget title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    body,
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
    required this.title,
    required this.body,
    required this.rows,
  });

  final Widget title;
  final Widget body;
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
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineLarge!,
                  child: title,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    body,
                    const SizedBox(height: 16),
                    const Expanded(child: Placeholder()),
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder(
                        horizontalInside: Divider.createBorderSide(context),
                      ),
                      columnWidths: const {0: IntrinsicColumnWidth()},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
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
    required this.title,
    required this.body,
    required this.rows,
  });

  final Widget title;
  final Widget body;
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
              const Expanded(
                flex: 9,
                child: Placeholder(),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 1),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    body,
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder(
                        horizontalInside: Divider.createBorderSide(context),
                      ),
                      columnWidths: const {0: IntrinsicColumnWidth()},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
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

class SlideLayout3 extends StatelessWidget {
  const SlideLayout3({
    super.key,
    required this.title,
    required this.body,
    required this.rows,
  });

  final Widget title;
  final Widget body;
  final List<TableRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: kYaruTitleBarHeight + 8),
        const Expanded(
          child: Placeholder(),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 8,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineLarge!,
                  child: title,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    body,
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder(
                        horizontalInside: Divider.createBorderSide(context),
                      ),
                      columnWidths: const {0: IntrinsicColumnWidth()},
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: rows,
                    ),
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

class SlideLayout4 extends StatelessWidget {
  const SlideLayout4({
    super.key,
    required this.title,
    required this.body,
    required this.rows,
  });

  final Widget title;
  final Widget body;
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    Expanded(child: body),
                  ],
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(child: Placeholder()),
                    const SizedBox(height: 32),
                    for (final row in rows)
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('\u2022'),
                            const SizedBox(width: 4),
                            row,
                          ],
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
