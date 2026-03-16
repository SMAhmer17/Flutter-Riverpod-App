import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/core/router/app_route_constants.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(AppRouteName.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, size: 64, color: Colors.blue),
              const SizedBox(height: 16),
              Text(
                t.common.appName,
                style: context.interBody(size: 22, weight: FontWeight.bold),
                // style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                //   fontWeight: FontWeight.bold,
                // ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                t.home.welcome,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.check_circle_outline,
                      text: t.home.features.riverpod,
                    ),
                    _InfoRow(icon: Icons.language, text: t.home.features.i18n),
                    _InfoRow(icon: Icons.route, text: t.home.features.router),
                    _InfoRow(
                      icon: Icons.palette_outlined,
                      text: t.home.features.theme,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _MenuButton(
                label: t.home.testAssets,
                icon: Icons.image_outlined,
                onTap: () => context.pushNamed(AppRouteName.images),
              ),
              const SizedBox(height: 16),
              _MenuButton(
                label: t.settings.title,
                icon: Icons.settings_outlined,
                onTap: () => context.pushNamed(AppRouteName.settings),
              ),
              const Spacer(),
              Text(
                t.home.architecture,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.green),
          const SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
