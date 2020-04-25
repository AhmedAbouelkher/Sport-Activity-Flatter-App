import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/blur_container.dart';
import 'package:sport_activity_dashboard_app/widgets/surfing_chart.dart';

class CenterQuickChart extends StatelessWidget {
  const CenterQuickChart({
    Key key,
    @required SequenceAnimation exitingSequenceAnimation,
    @required SequenceAnimation enteringSequenceAnimation,
  })  : _exitingSequenceAnimation = exitingSequenceAnimation,
        _enteringSequenceAnimation = enteringSequenceAnimation,
        super(key: key);

  final SequenceAnimation _exitingSequenceAnimation;
  final SequenceAnimation _enteringSequenceAnimation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -0.1),
      child: AnimatedBuilder(
        animation: _exitingSequenceAnimation['exiting_chart'],
        builder: (context, child) {
          double exitingAnimationValue =
              _exitingSequenceAnimation['exiting_chart'].value;
          return Transform.translate(
            offset: Offset(0, 500 * exitingAnimationValue),
            child: child,
          );
        },
        child: AnimatedBuilder(
          animation: _enteringSequenceAnimation['chart'],
          builder: (context, child) {
            double animationValue =
                1 - _enteringSequenceAnimation['chart'].value;
            double counter = _enteringSequenceAnimation['chart_counter'].value;
            return BlurContainer(
              height: 170,
              width: rspo.screenWidth - 80,
              angleX: -90 * animationValue,
              sigmaX: 5 * animationValue,
              sigmaY: 5 * animationValue,
              child: Chart(
                counter: 12.5 * counter,
                isPaused: false,
              ),
            );
          },
        ),
      ),
    );
  }
}
