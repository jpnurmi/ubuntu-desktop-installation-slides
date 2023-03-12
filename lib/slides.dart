import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

TextStyle _headlineStyle(BuildContext context) {
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

Map<String, Style> _linkStyle(BuildContext context) {
  return {
    'body': Style(margin: Margins.zero),
    'a': Style(
      color: Theme.of(context).colorScheme.onBackground,
      textDecoration: TextDecoration.none,
    ),
  };
}

class SlideScreenshot extends StatelessWidget {
  const SlideScreenshot(
    this.name, {
    super.key,
    this.alignment = Alignment.center,
    this.background,
    this.fit,
  });

  final String name;
  final Color? background;
  final AlignmentGeometry alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness.name;
    return DecoratedBox(
      decoration: BoxDecoration(color: background),
      child: Image.asset(
        'assets/installation_slides/screenshots/$theme/$name.png',
        errorBuilder: (_, __, ___) => Image.asset(
          'assets/installation_slides/screenshots/$name.png',
          alignment: alignment,
          fit: fit,
        ),
        alignment: alignment,
        fit: fit,
      ),
    );
  }
}

class SlideIcon extends StatelessWidget {
  const SlideIcon(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness.name;
    return Image.asset(
      'assets/installation_slides/icons/$theme/$name.png',
      errorBuilder: (_, __, ___) => Image.asset(
        'assets/installation_slides/icons/$name.png',
      ),
    );
  }
}

class SlideColumn extends StatelessWidget {
  const SlideColumn({super.key, required this.children, this.spacing});

  final List<Widget> children;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withSpacing(children, spacing ?? 16),
    );
  }

  static List<Widget> _withSpacing(List<Widget> children, double spacing) {
    return children
        .expand((item) sync* {
          yield SizedBox(height: spacing);
          yield item;
        })
        .skip(1)
        .toList();
  }
}

class SlideLink extends StatelessWidget {
  const SlideLink({super.key, required this.text, required this.url});

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: '<a href="$url">$text</a>',
      shrinkWrap: true,
      style: _linkStyle(context),
      onAnchorTap: (url, _, __, ___) => debugPrint('TODO: launch $url'),
    );
  }
}

class SlideLabel extends StatelessWidget {
  const SlideLabel({super.key, required this.icon, required this.label});

  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 24,
          child: icon,
        ),
        const SizedBox(width: 8),
        label,
      ],
    );
  }
}

class SlideRow {
  const SlideRow({required this.header, required this.children});

  final Widget header;
  final List<Widget> children;
}

class SlideTable extends StatelessWidget {
  const SlideTable({super.key, required this.rows});

  final List<SlideRow> rows;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: Divider.createBorderSide(context),
      ),
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(40),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        for (var i = 0; i < rows.length; ++i)
          TableRow(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: i > 0 ? 16 : 0,
                  bottom: 16,
                ),
                child: rows[i].header,
              ),
              const SizedBox.shrink(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: i > 0 ? 16 : 0,
                  bottom: 16,
                ),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: rows[i].children,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class SlideList extends StatelessWidget {
  const SlideList({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final child in children)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\u2022'),
                const SizedBox(width: 4),
                child,
              ],
            ),
          ),
      ],
    );
  }
}

class SlideLayout0 extends StatelessWidget {
  const SlideLayout0({
    super.key,
    required this.headline,
    required this.body,
    required this.image,
  });

  final Widget headline;
  final Widget body;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    DefaultTextStyle(
                      style: _headlineStyle(context).copyWith(fontSize: 30),
                      child: headline,
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
              Expanded(
                flex: 8,
                child: image,
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
    required this.headline,
    required this.body,
    required this.image,
    required this.table,
  });

  final Widget headline;
  final Widget body;
  final Widget image;
  final Widget table;

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
                  style: _headlineStyle(context),
                  child: headline,
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
                    image,
                    const SizedBox(height: 16),
                    table,
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
    required this.headline,
    required this.body,
    required this.image,
    required this.table,
  });

  final Widget headline;
  final Widget body;
  final Widget image;
  final Widget table;

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
              image,
              const Spacer(flex: 1),
              Expanded(
                flex: 14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 1),
                    DefaultTextStyle(
                      style: _headlineStyle(context),
                      child: headline,
                    ),
                    const SizedBox(height: 16),
                    DefaultTextStyle(
                      style: _bodyStyle(context),
                      child: body,
                    ),
                    const SizedBox(height: 16),
                    table,
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
    required this.headline,
    required this.body,
    required this.image,
    required this.table,
  });

  final Widget headline;
  final Widget body;
  final Widget image;
  final Widget table;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: kYaruTitleBarHeight + 8),
        Expanded(child: image),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 8,
                child: DefaultTextStyle(
                  style: _headlineStyle(context),
                  child: headline,
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
                    table,
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
    required this.headline,
    required this.body,
    required this.image,
    required this.list,
  });

  final Widget headline;
  final Widget body;
  final Widget image;
  final Widget list;

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
                      style: _headlineStyle(context),
                      child: headline,
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
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: image,
                    ),
                    const SizedBox(height: 48),
                    Expanded(child: list),
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
