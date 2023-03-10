import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'grid.dart';
import 'l10n.dart';
import 'settings.dart';
import 'slides.dart';
import 'transitions.dart';

void main() {
  runApp(const SettingsProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) {
        return MaterialApp(
            theme: yaru.theme,
            darkTheme: yaru.darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: Settings.themeOf(context),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            builder: (context, child) => Stack(
                  children: [
                    child!,
                    const LayoutGrid(),
                  ],
                ),
            home: const MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final rows = [
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(bottom: 16, end: 40),
            child: Text('Included:'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: const [
                SizedBox.square(
                  dimension: 24,
                  child: Placeholder(),
                ),
                SizedBox(width: 8),
                Text('FeralGameMode'),
              ],
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 40, 16),
            child: Text('Available:'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox.square(dimension: 24, child: Placeholder()),
                    SizedBox(width: 8),
                    Text('Steam'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox.square(dimension: 24, child: Placeholder()),
                    SizedBox(width: 8),
                    Text('Discord'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox.square(dimension: 24, child: Placeholder()),
                    SizedBox(width: 8),
                    Text('OBS Studio'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ];

    const flavor = 'Ubuntu';
    const product = 'Ubuntu XX.XX';

    final slides = [
      SlideLayout0(
        headline: Text(context.l10n.welcomeSlideTitle),
        body: Column(
          children: [
            Text(context.l10n.welcomeSlideHeader(flavor)),
            const SizedBox(height: 16),
            Text(context.l10n.welcomeSlideBody(product)),
          ],
        ),
        image: const Placeholder(),
      ),
      SlideLayout3(
        headline: Text(context.l10n.applicationSlideTitle),
        body: Text(context.l10n.applicationSlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout2(
        headline: Text(context.l10n.developmentSlideTitle),
        body: Text(context.l10n.developmentSlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout1(
        headline: Text(context.l10n.creativitySlideTitle),
        body: Text(context.l10n.creativitySlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout3(
        headline: Text(context.l10n.gamingSlideTitle),
        body: Text(context.l10n.gamingSlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout1(
        headline: Text(context.l10n.securitySlideTitle),
        body: Text(context.l10n.securitySlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout3(
        headline: Text(context.l10n.productivitySlideTitle),
        body: Text(context.l10n.productivitySlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout2(
        headline: Text(context.l10n.accessibilitySlideTitle),
        body: Text(context.l10n.accessibilitySlideBody(flavor)),
        image: const Placeholder(),
        rows: rows,
      ),
      SlideLayout4(
        headline: Text(context.l10n.supportSlideTitle),
        body: Column(
          children: [
            Text(context.l10n.supportSlideHeader(flavor)),
            const SizedBox(height: 16),
            Text(context.l10n.supportSlideCommunity),
            const SizedBox(height: 16),
            Text(context.l10n.supportSlideEnterprise),
          ],
        ),
        image: const Placeholder(),
        rows: [
          Text(context.l10n.supportSlideDocumentation),
          const Text('Ask Ubuntu'),
          const Text('Ubuntu Discourse'),
          Text(context.l10n.supportSlideUbuntuPro),
        ],
      ),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const YaruWindowTitleBar(
        title: Text('Welcome to $flavor'),
        isMinimizable: false,
        isMaximizable: false,
        backgroundColor: Colors.transparent,
        actions: [SettingsButton()],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          pageTransitionsTheme: const SlideTransitionsTheme(),
        ),
        child: Navigator(
          pages: [
            for (var i = 0; i <= _index; ++i)
              SlidePage(
                key: ValueKey(i),
                child: slides[i],
              ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
      bottomNavigationBar: BottomBar(
        progress: 0.35,
        status: 'Installing the system...',
        onNext:
            _index < slides.length - 1 ? () => setState(() => ++_index) : null,
        onPrevious: _index > 0 ? () => setState(() => --_index) : null,
      ),
    );
  }
}
