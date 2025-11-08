import 'package:assesment/theme/app_theme.dart'; // Added import
import 'package:assesment/viewmodels/item_provider.dart'; // Added import
import 'package:assesment/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/item_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ItemModelAdapter());

  await Hive.openBox<ItemModel>('items');
  await Hive.openBox('settings');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the theme mode from our provider
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Item Manager',
      debugShowCheckedModeBanner: false,

      theme: ref.watch(lightThemeProvider),

      darkTheme: ref.watch(darkThemeProvider),

      themeMode: themeMode,

      home: const SplashScreen(),
    );
  }
}
