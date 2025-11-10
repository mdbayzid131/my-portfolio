import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedNightSky extends StatefulWidget {
  const AnimatedNightSky({super.key});

  @override
  State<AnimatedNightSky> createState() => _AnimatedNightSkyState();
}

class _AnimatedNightSkyState extends State<AnimatedNightSky>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _stars = <_Star>[];
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat(reverse: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createStars();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _createStars() {
    final size = MediaQuery.of(context).size;
    for (var i = 0; i < 120; i++) {
      _stars.add(
        _Star(
          size: 1.5 + _random.nextDouble() * 2.5,
          startPosition: Offset(
            _random.nextDouble() * size.width,
            _random.nextDouble() * size.height,
          ),
          dxSpeed: (_random.nextDouble() - 0.5) * 0.3, // অনুভূমিক মুভমেন্ট
          dySpeed: (_random.nextDouble() - 0.5) * 0.3, // উল্লম্ব মুভমেন্ট
          animationOffset: _random.nextDouble() * 2 * pi,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF020617),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final time = _controller.value * 2 * pi;
          return Stack(
            children: _stars.map((star) {
              // অবস্থান পরিবর্তন (floating motion)
              final dx = star.startPosition.dx + sin(time + star.animationOffset) * 20 * star.dxSpeed;
              final dy = star.startPosition.dy + cos(time + star.animationOffset) * 20 * star.dySpeed;

              // twinkle effect
              final opacity = 0.3 + 0.7 * sin(time + star.animationOffset).abs();

              return Positioned(
                left: dx,
                top: dy,
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    width: star.size,
                    height: star.size,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class _Star {
  final double size;
  final Offset startPosition;
  final double dxSpeed;
  final double dySpeed;
  final double animationOffset;

  _Star({
    required this.size,
    required this.startPosition,
    required this.dxSpeed,
    required this.dySpeed,
    required this.animationOffset,
  });
}
