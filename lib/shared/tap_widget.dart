import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';

class TapWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Function(TapDownDetails)? onTapDown;
  final Color? overlayColor;
  final double? radius, elevation;
  final GestureTapCallback? onTap;
  final void Function()? onLongPress;
  final Color? color, /*hoverColor,*/ splashColor, shadowColor;

  const TapWidget({
    super.key,
    this.onTap,
    this.color,
    this.radius,
    this.padding,
    this.elevation,
    // this.hoverColor,
    this.splashColor,
    this.shadowColor,
    required this.child,
    this.overlayColor,
    this.onLongPress,
    this.onTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: _elevation,
      shadowColor: shadowColor,
      color: color ?? Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 100),
      child: InkWell(
        onTapDown: onTapDown,
        onLongPress: onLongPress,
        onTap: onTap,
        splashColor: splashColor,
        // highlightColor: overlayColor?.withAlpha(30),
        highlightColor: context.theme.primary.withAlpha(30),
        borderRadius: BorderRadius.circular(radius ?? 100),
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }

  double get _elevation {
    if (elevation != null) {
      return elevation!;
    } else if (shadowColor != null) {
      return 1;
    } else {
      return 0;
    }
  }
}
