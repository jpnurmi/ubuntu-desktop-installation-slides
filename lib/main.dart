import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'grid.dart';
import 'settings.dart';
import 'slides.dart';

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
  final _controller = PageController();

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

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const YaruWindowTitleBar(
        isMinimizable: false,
        isMaximizable: false,
        backgroundColor: Colors.transparent,
        actions: [SettingsButton()],
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SlideLayout0(
            tagline: 'Fast, free and full of new features',
            introduction:
                'The latest version of Ubuntu makes computing easier than ever. Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in Ubuntu 23.04',
          ),
          SlideLayout1(
            tagline: 'Enhance your creativity',
            introduction:
                'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.',
            rows: rows,
          ),
          SlideLayout2(
            tagline: 'Enhance your creativity',
            introduction:
                'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.',
            rows: rows,
          ),
          SlideLayout3(
            tagline: 'Enhance your creativity',
            introduction:
                'Ubuntu supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on Ubuntu via applications like Steam with no additional configuration.',
            rows: rows,
          ),
          const SlideLayout4(
            tagline: 'Help & Support',
            introduction:
                'The official Ubuntu documentation is available both online and via the Help icon in the dock.\n\nAsk Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.\n\nFor enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.',
            rows: [
              Text('Official documentation'),
              Text('Ask Ubuntu'),
              Text('Ubuntu Discourse'),
              Text('Enterprise-grade 24/7 support\nwith Ubuntu Pro'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        progress: 0.35,
        status: 'Installing the system...',
        onNext: () => _controller.nextPage(
          duration: kThemeAnimationDuration,
          curve: Curves.easeInOut,
        ),
        onPrevious: () => _controller.previousPage(
          duration: kThemeAnimationDuration,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
