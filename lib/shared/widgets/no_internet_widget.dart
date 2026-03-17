import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/shared/primary_button.dart';


class NoInternetWidget extends StatefulWidget {
  final VoidCallback? onRetry;
  final String? title;
  final String? subtitle;
  final String? retryLabel;
  final bool expand;

  // ————————————————— Constructor —————————————————

  const NoInternetWidget({
    super.key,
    this.onRetry,
    this.title,
    this.subtitle,
    this.retryLabel,
    this.expand = true,
  });

  @override
  State<NoInternetWidget> createState() => _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget>
    with SingleTickerProviderStateMixin {
  // ————————————————— Animation —————————————————

  late final AnimationController _controller;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ————————————————— Build —————————————————

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final content = _buildContent(theme, context);

    return widget.expand
        ? SizedBox.expand(child: Center(child: content))
        : content;
  }

  Widget _buildContent(dynamic theme, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          ScaleTransition(
            scale: _pulse,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: context.theme.error.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_rounded,
                    size: 44,
                    color: context.theme.error.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            widget.title ?? 'No Internet Connection',
            textAlign: TextAlign.center,
            style: context.interBody(
              size: 18,
              weight: FontWeight.w600,
              color: context.theme.textPrimary,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            widget.subtitle ??
                'Please check your connection and try again.',
            textAlign: TextAlign.center,
            style: context.interBody(
              size: 14,
              weight: FontWeight.w400,
              color: context.theme.textSecondary,
              height: 1.5,
            ),
          ),
          if (widget.onRetry != null) ...[
            const SizedBox(height: 32),
            PrimaryButton(
              title: widget.retryLabel ?? 'Try Again',
              onTap: widget.onRetry,
              borderRadius: 12,
            ),
          ],
        ],
      ),
    );
  }
}
