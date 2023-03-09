import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

TextStyle _titleStyle(BuildContext context) {
  return TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w300,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle _bodyStyle(BuildContext context) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.5,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

class SlideLayout0 extends StatelessWidget {
  const SlideLayout0({
    super.key,
    required this.title,
    required this.body,
    required this.image,
  });

  final Widget title;
  final Widget body;
  final Widget image;

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
                      style: _titleStyle(context).copyWith(fontSize: 30),
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
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
                  style: _titleStyle(context),
                  child: title,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
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
                      style: _titleStyle(context),
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
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
                  style: _titleStyle(context),
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
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
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
                      style: _titleStyle(context),
                      child: title,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: DefaultTextStyle(
                        style: _bodyStyle(context),
                        child: body,
                      ),
                    ),
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
