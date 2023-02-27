import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
    final settings = Settings.of(context).value;
    return MenuAnchor(
      controller: _controller,
      crossAxisUnconstrained: false,
      style: const MenuStyle(
        minimumSize: MaterialStatePropertyAll(Size(160, 0)),
      ),
      menuChildren: [
        CheckboxMenuButton(
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (value) => Settings.of(context).value = settings.copyWith(
              theme: value == true ? ThemeMode.dark : ThemeMode.light),
          child: const Text('Dark'),
        ),
        CheckboxMenuButton(
          value: Settings.gridOf(context),
          onChanged: (value) =>
              Settings.of(context).value = settings.copyWith(grid: value!),
          child: const Text('Grid'),
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
  });

  final ThemeMode theme;
  final bool grid;

  Settings copyWith({
    ThemeMode? theme,
    bool? grid,
  }) {
    return Settings(
      theme: theme ?? this.theme,
      grid: grid ?? this.grid,
    );
  }

  static ValueNotifier<Settings> of(BuildContext context) {
    return context.read<ValueNotifier<Settings>>();
  }

  static ThemeMode themeOf(BuildContext context) {
    return context.select((ValueNotifier<Settings> s) => s.value.theme);
  }

  static bool gridOf(BuildContext context) {
    return context.select((ValueNotifier<Settings> s) => s.value.grid);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Settings && other.theme == theme && other.grid == grid;
  }

  @override
  int get hashCode => Object.hash(theme, grid);
}
