import 'dart:ui';

import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            scheme.surface,
            scheme.surfaceContainerHighest,
            scheme.surfaceContainer,
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _GlowBlob(
            size: 260,
            top: -70,
            left: -40,
            color: scheme.primary.withValues(alpha: 0.26),
          ),
          _GlowBlob(
            size: 320,
            bottom: -140,
            right: -90,
            color: scheme.tertiary.withValues(alpha: 0.22),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({
    required this.size,
    required this.color,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  final double size;
  final Color color;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: IgnorePointer(
        child: RepaintBoundary(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }
}
