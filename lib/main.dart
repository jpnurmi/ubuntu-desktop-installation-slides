import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'bottom_bar.dart';
import 'grid.dart';
import 'l10n.dart';
import 'settings.dart';
import 'slides.dart';
import 'transitions.dart';

void main() => runApp(const SettingsProvider(child: SlidesApp()));

class SlidesApp extends StatelessWidget {
  const SlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      builder: (context, yaru, child) => MaterialApp(
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
        home: const SlidesPage(),
      ),
    );
  }
}

class SlidesPage extends StatefulWidget {
  const SlidesPage({super.key});

  @override
  State<SlidesPage> createState() => _SlidesPageState();
}

class _SlidesPageState extends State<SlidesPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    const flavor = 'Ubuntu';
    const product = 'Ubuntu XX.XX';
    final theme = Theme.of(context).brightness.name;

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
        image: const SlideScreenshot(
          'store',
          alignment: Alignment.center,
          background: Color(0xff2c2c2c),
        ),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('spotify'),
                  label: Text('Spotify'),
                ),
                SlideLabel(
                  icon: SlideIcon('shotcut'),
                  label: Text('Shotcut'),
                ),
                SlideLabel(
                  icon: SlideIcon('telegram'),
                  label: Text('Telegram'),
                ),
                SlideLabel(
                  icon: SlideIcon('nextcloud'),
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
        image: const SlideScreenshot('vscode'),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('vscode'),
                  label: Text('Visual Studio Code'),
                ),
                SlideLabel(
                  icon: SlideIcon('intellij'),
                  label: Text('IDEA Ultimate'),
                ),
                SlideLabel(
                  icon: SlideIcon('pycharm'),
                  label: Text('Pycharm'),
                ),
                SlideLabel(
                  icon: SlideIcon('gitkraken'),
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
        image: const SlideScreenshot('blender'),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('blender'),
                  label: Text('Blender'),
                ),
                SlideLabel(
                  icon: SlideIcon('audacity'),
                  label: Text('Audacity'),
                ),
                SlideLabel(
                  icon: SlideIcon('kdenlive'),
                  label: Text('Kdenlive'),
                ),
                SlideLabel(
                  icon: SlideIcon('godot'),
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
        image: const SlideScreenshot(
          'dota',
          alignment: Alignment.topLeft,
          fit: BoxFit.cover,
        ),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: const [
                SlideLabel(
                  icon: SlideIcon('gamemode'),
                  label: Text('Feral GameMode'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('steam'),
                  label: Text('Steam'),
                ),
                SlideLabel(
                  icon: SlideIcon('discord'),
                  label: Text('Discord'),
                ),
                SlideLabel(
                  icon: SlideIcon('obs'),
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
                  icon: SlideIcon('firefox'),
                  label: Text('Firefox'),
                ),
                SlideLabel(
                  icon: SlideIcon('wireguard'),
                  label: Text('WireGuard'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('brave'),
                  label: Text('Brave'),
                ),
                SlideLabel(
                  icon: SlideIcon('bitwarden'),
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
                  icon: SlideIcon('thunderbird'),
                  label: Text('Thunderbird'),
                ),
                SlideLabel(
                  icon: SlideIcon('libreoffice'),
                  label: Text('LibreOffice'),
                ),
              ],
            ),
            SlideRow(
              header: Text(context.l10n.installationSlidesAvailable),
              children: const [
                SlideLabel(
                  icon: SlideIcon('zoom'),
                  label: Text('Zoom'),
                ),
                SlideLabel(
                  icon: SlideIcon('teams'),
                  label: Text('Microsoft Teams'),
                ),
                SlideLabel(
                  icon: SlideIcon('slack'),
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
        image: const SlideScreenshot('accessibility'),
        table: SlideTable(
          rows: [
            SlideRow(
              header: Text(context.l10n.installationSlidesIncluded),
              children: [
                const SlideLabel(
                  icon: SlideIcon('writer'),
                  label: Text('LibreOffice Writer'),
                ),
                SlideLabel(
                  icon: const SlideIcon('orca'),
                  label: Text(context.l10n.accessibilitySlideScreenReader),
                ),
                SlideLabel(
                  icon: const SlideIcon('languages'),
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
        image: SvgPicture.asset(
          'assets/installation_slides/icons/$theme/ask-ubuntu.svg',
        ),
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
