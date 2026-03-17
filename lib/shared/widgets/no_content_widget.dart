
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/shared/primary_button.dart';

class NoContentWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? retryLabel;
  final VoidCallback? onRetry;

  const NoContentWidget({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    this.subtitle,
    this.retryLabel,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: theme.primary.withValues(alpha: 0.6),
              ),
            ),

            const SizedBox(height: 24),

      
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.interBody(
                size: 18,
                weight: FontWeight.w600,
                color: theme.textPrimary,
              ),
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: context.interBody(
                  size: 14,
                  weight: FontWeight.w400,
                  color: theme.textSecondary,
                  height: 1.5,
                ),
              ),
            ],

          if (onRetry != null) ...[
              const SizedBox(height: 32),
              PrimaryButton(
                title: retryLabel ?? 'Retry',
                onTap: onRetry,
                borderRadius: 12,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
