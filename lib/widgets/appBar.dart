import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.animation,
    this.slowerAnimation,
    this.animationInitialValue = 0,
    this.slowerAnimationInitialValue = 0,
  }) : super(key: key);
  final Animation animation;
  final Animation slowerAnimation;
  final double animationInitialValue;
  final double slowerAnimationInitialValue;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double fastAnimaionValue = 1 - animation.value;
          double slowAnimationValue = 1 - slowerAnimation.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(
                        0, slowerAnimationInitialValue * slowAnimationValue),
                    child: Text(
                      'Rating',
                      style: mainTextStyle.copyWith(
                        fontSize: 16,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Transform.translate(
                    offset:
                        Offset(0, fastAnimaionValue * animationInitialValue),
                    child: Text(
                      'Top Activity',
                      style: mainTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Transform.translate(
                offset: Offset(0, animationInitialValue * fastAnimaionValue),
                child: FaIcon(
                  FontAwesomeIcons.calendar,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          );
        });
  }
}
