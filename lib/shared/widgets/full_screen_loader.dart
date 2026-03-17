import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: CircularProgressIndicator(color: context.theme.primary),
      ),
    );
  }
}
