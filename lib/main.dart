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
    const flavor = 'Ubuntu';
    const product = 'Ubuntu XX.XX';

    final slides = [
      SlideLayout0(
        headline: Text(context.l10n.welcomeSlideTitle),
        body: SlideColumn(
          children: [
            Text(context.l10n.welcomeSlideHeader(flavor)),
            Text(context.l10n.welcomeSlideBody(product)),
          ],
        ),
        image: const Placeholder(),
      ),
      SlideLayout3(
        headline: Text(context.l10n.applicationSlideTitle),
        body: Text(context.l10n.applicationSlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Spotify'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Shotcut'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Telegram'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Nextcloud'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout2(
        headline: Text(context.l10n.developmentSlideTitle),
        body: Text(context.l10n.developmentSlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Visual Studio Code'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('IDEA Ultimate'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Pycharm'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('GitKraken'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout1(
        headline: Text(context.l10n.creativitySlideTitle),
        body: Text(context.l10n.creativitySlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Blender'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Audacity'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Kdenlive'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Godot'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout3(
        headline: Text(context.l10n.gamingSlideTitle),
        body: Text(context.l10n.gamingSlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Feral GameMode'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Steam'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Discord'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('OBS Studio'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout1(
        headline: Text(context.l10n.securitySlideTitle),
        body: Text(context.l10n.securitySlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Firefox'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('WireGuard'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Brave'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Bitwarden'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout3(
        headline: Text(context.l10n.productivitySlideTitle),
        body: Text(context.l10n.productivitySlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Thunderbird'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('LibreOffice'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Zoom'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Microsoft Teams'),
                ),
                SlideLabel(
                  icon: Placeholder(),
                  label: Text('Slack'),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout2(
        headline: Text(context.l10n.accessibilitySlideTitle),
        body: Text(context.l10n.accessibilitySlideBody(flavor)),
        image: const Placeholder(),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: [
                const SlideLabel(
                  icon: Placeholder(),
                  label: Text('LibreOffice Writer'),
                ),
                SlideLabel(
                  icon: const Placeholder(),
                  label: Text(context.l10n.accessibilitySlideScreenReader),
                ),
                SlideLabel(
                  icon: const Placeholder(),
                  label: Text(context.l10n.accessibilitySlideLanguageSupport),
                ),
              ],
            ),
          ],
        ),
      ),
      SlideLayout4(
        headline: Text(context.l10n.supportSlideTitle),
        body: SlideColumn(
          children: [
            Text(context.l10n.supportSlideHeader(flavor)),
            Text(context.l10n.supportSlideCommunity),
            Text(context.l10n.supportSlideEnterprise),
          ],
        ),
        image: const Placeholder(),
        list: SlideList(
          children: [
            SlideLink(
              text: context.l10n.supportSlideDocumentation,
              url: 'https://help.ubuntu.com/',
            ),
            const SlideLink(
              text: 'Ask Ubuntu',
              url: 'https://askubuntu.com/',
            ),
            const SlideLink(
              text: 'Ubuntu Discourse',
              url: 'https://discourse.ubuntu.com/',
            ),
            SlideLink(
              text: context.l10n.supportSlideUbuntuPro,
              url: 'https://ubuntu.com/pro',
            ),
          ],
        ),
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
