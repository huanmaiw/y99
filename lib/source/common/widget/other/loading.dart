import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.aspectRatio = 0.6});

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * aspectRatio,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(180.0),
          //child: Assets.animations.loading.lottie(),
        ),
      ),
    );
  }
}
