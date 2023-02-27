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
        children: const [
          SlideLayout0(
            tagline: 'Fast, free and full of new features',
            introduction:
                'The latest version of Ubuntu makes computing easier than ever. Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in Ubuntu 23.04',
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
