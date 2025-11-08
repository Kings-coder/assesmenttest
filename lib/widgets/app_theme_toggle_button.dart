import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assesment/viewmodels/item_provider.dart';

class AppThemeToggleButton extends ConsumerWidget {
  const AppThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeNotifier = ref.watch(themeModeProvider.notifier);
    final currentThemeMode = ref.watch(themeModeProvider);

    return IconButton(
      icon: Icon(
        currentThemeMode == ThemeMode.dark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () {
        themeModeNotifier.setThemeMode(
          currentThemeMode == ThemeMode.dark
              ? ThemeMode.light
              : ThemeMode.dark,
        );
      },
    );
  }
}