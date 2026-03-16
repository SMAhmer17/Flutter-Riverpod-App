import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/providers/assets_provider.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagesScreen extends ConsumerWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final appIcons = ref.watch(appIconsProvider);
    final appImages = ref.watch(appImagesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.images.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.images.description,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            Text(t.images.icons, style: Theme.of(context).textTheme.titleLarge),
            const Divider(),
            _AssetRow(
              label: t.images.visible,
              child: SvgPicture.asset(appIcons.visible, height: 40),
            ),
            _AssetRow(
              label: t.images.invisible,
              child: SvgPicture.asset(appIcons.invisible, height: 40),
            ),
            const SizedBox(height: 32),
            Text(
              t.images.images,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            _AssetRow(
              label: t.images.appLogo,
              child: Image.asset(appImages.compass, height: 100),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info_outline),
                label: Text(t.images.toggleHint),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssetRow extends StatelessWidget {
  final String label;
  final Widget child;

  const _AssetRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          child,
        ],
      ),
    );
  }
}
