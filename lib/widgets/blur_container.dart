import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  BlurContainer({
    this.angleX = 0.0,
    this.height = 0.0,
    this.width = 0.0,
    this.child,
    this.sigmaX = 0.0,
    this.sigmaY = 0.0,
    this.setEntryV,
  });
  //angle in degrees
  final double angleX;
  final double height;
  final double width;
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final double setEntryV;
  double degToRad(double angle) {
    return -angle * (math.pi / 180);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, setEntryV ?? 0.002)
            ..rotateX(degToRad(angleX)),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height,
            width: width,
            child: child,
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, setEntryV ?? 0.002)
            ..rotateX(degToRad(angleX)),
          alignment: Alignment.bottomCenter,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
              ),
            ),
          ),
        )
      ],
    );
  }
}
