import 'dart:math';

import 'package:flutter/material.dart';

class RotatedTire extends StatefulWidget {
  const RotatedTire({Key? key}) : super(key: key);

  @override
  _RotatedTireState createState() => _RotatedTireState();
}

class _RotatedTireState extends State<RotatedTire>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: child,
            );
          },
          child: Image.asset('assets/images/car_wheel.png'),
        ),
    );
  }
}