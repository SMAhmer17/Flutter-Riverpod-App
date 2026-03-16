import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/providers/language_notifier_provider.dart';
import 'package:flutter_riverpod_template/core/providers/package_info_provider.dart';
import 'package:flutter_riverpod_template/core/providers/theme_notifier_provider.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final themeMode = ref.watch(themeNotifierProvider);
    final packageInfo = ref.watch(packageInfoProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.settings.title)),
      body: ListView(
        children: [
          ListTile(
            title: Text(t.settings.theme),
            subtitle: Text(themeMode.toString()),
            trailing: IconButton(
              icon: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleTheme();
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(t.settings.language),
            subtitle: Text(
              TranslationProvider.of(context).locale.languageCode.toUpperCase(),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => ref
                      .read(languageNotifierProvider.notifier)
                      .setLanguage(AppLocale.en),
                  child: const Text('EN'),
                ),
                TextButton(
                  onPressed: () => ref
                      .read(languageNotifierProvider.notifier)
                      .setLanguage(AppLocale.fr),
                  child: const Text('FR'),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.settings.appInfo,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text('${t.settings.version}: ${packageInfo.version}'),
                Text('${t.settings.buildNumber}: ${packageInfo.buildNumber}'),
                Text('${t.settings.packageName}: ${packageInfo.packageName}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
