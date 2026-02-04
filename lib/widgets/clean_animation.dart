import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CleanAnimation extends StatelessWidget {
  const CleanAnimation({super.key, required this.progress, this.height = 220});

  final double progress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Lottie.asset(
        'assets/lottie/clean_wave.json',
        repeat: true,
        animate: true,
        frameRate: FrameRate.max,
        errorBuilder: (context, error, stackTrace) {
          return SvgPicture.asset('assets/svg/clean_wave_fallback.svg');
        },
      ),
    );
  }
}
