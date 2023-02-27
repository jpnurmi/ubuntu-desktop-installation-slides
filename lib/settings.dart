import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const kCompactSize = Size(800, 600);
const kNormalSize = Size(960, 680);

class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ValueNotifier(Settings()),
      child: child,
    );
  }
}

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  final _controller = MenuController();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _controller,
      crossAxisUnconstrained: false,
      style: const MenuStyle(
        minimumSize: MaterialStatePropertyAll(Size(160, 0)),
      ),
      menuChildren: [
        CheckboxMenuButton(
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) => Settings.apply(context,
              theme: value == true ? ThemeMode.dark : ThemeMode.light),
          child: const Text('Dark'),
        ),
        CheckboxMenuButton(
          value: Settings.gridOf(context),
          onChanged: (value) => Settings.apply(context, grid: value!),
          child: const Text('Grid'),
        ),
        CheckboxMenuButton(
          value: Settings.compactOf(context),
          onChanged: (value) {
            Settings.apply(context, compact: value!);
            windowManager.setSize(value == true ? kCompactSize : kNormalSize);
          },
          child: const Text('Compact'),
        ),
      ],
      child: SizedBox.square(
        dimension: kYaruWindowControlSize,
        child: IconButton(
          onPressed: _controller.open,
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          iconSize: 16,
          icon: const Icon(YaruIcons.pan_down),
        ),
      ),
    );
  }
}

class Settings {
  Settings({
    this.theme = ThemeMode.system,
    this.grid = false,
    this.compact = false,
  });

  final ThemeMode theme;
  final bool grid;
  final bool compact;

  Settings copyWith({
    ThemeMode? theme,
    bool? grid,
    bool? compact,
  }) {
    return Settings(
      theme: theme ?? this.theme,
      grid: grid ?? this.grid,
      compact: compact ?? this.compact,
    );
  }

  static ThemeMode themeOf(BuildContext context) {
    return context.select((ValueNotifier<Settings> s) => s.value.theme);
  }

  static bool gridOf(BuildContext context) {
    return context.select((ValueNotifier<Settings> s) => s.value.grid);
  }

  static bool compactOf(BuildContext context) {
    return context.select((ValueNotifier<Settings> s) => s.value.compact);
  }

  static void apply(
    BuildContext context, {
    ThemeMode? theme,
    bool? grid,
    bool? compact,
  }) {
    final settings = context.read<ValueNotifier<Settings>>();
    settings.value = settings.value.copyWith(
      theme: theme,
      grid: grid,
      compact: compact,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Settings &&
        other.theme == theme &&
        other.grid == grid &&
        other.compact == compact;
  }

  @override
  int get hashCode => Object.hash(theme, grid, compact);
}
