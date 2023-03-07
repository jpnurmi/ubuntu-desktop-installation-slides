import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'grid.dart';
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
            child: Row(
              children: const [
                SizedBox.square(dimension: 24, child: Placeholder()),
                SizedBox(width: 8),
                Text('Steam'),
                SizedBox(width: 24),
                SizedBox.square(dimension: 24, child: Placeholder()),
                SizedBox(width: 8),
                Text('Discord'),
                SizedBox(width: 24),
                SizedBox.square(dimension: 24, child: Placeholder()),
                SizedBox(width: 8),
                Text('OBS Studio'),
              ],
            ),
          ),
        ],
      ),
    ];

    final slides = [
      const SlideLayout0(
        title: Text('Fast, free and full of new features'),
        body: Text(
            'The latest version of Ubuntu makes computing easier than ever. Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in Ubuntu 23.04'),
      ),
      SlideLayout1(
        title: const Text('Enhance your creativity'),
        body: const Text(
            'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.'),
        rows: rows,
      ),
      SlideLayout2(
        title: const Text('Enhance your creativity'),
        body: const Text(
            'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.'),
        rows: rows,
      ),
      SlideLayout3(
        title: const Text('Enhance your creativity'),
        body: const Text(
            'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.'),
        rows: rows,
      ),
      const SlideLayout4(
        title: Text('Help & Support'),
        body: Text(
            'The official Ubuntu documentation is available both online and via the Help icon in the dock.\n\nAsk Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.\n\nFor enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.'),
        rows: [
          Text('Official documentation'),
          Text('Ask Ubuntu'),
          Text('Ubuntu Discourse'),
          Text('Enterprise-grade 24/7 support\nwith Ubuntu Pro'),
        ],
      ),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const YaruWindowTitleBar(
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
