import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/user_avater.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required SequenceAnimation exitingSequenceAnimation,
    @required SequenceAnimation enteringSequenceAnimation,
    @required AnimationController exitingController,
    this.onTapGo,
  })  : _exitingSequenceAnimation = exitingSequenceAnimation,
        _enteringSequenceAnimation = enteringSequenceAnimation,
        _exitingController = exitingController,
        super(key: key);

  final SequenceAnimation _exitingSequenceAnimation;
  final SequenceAnimation _enteringSequenceAnimation;
  final AnimationController _exitingController;
  final VoidCallback onTapGo;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: null,
      child: AnimatedBuilder(
        animation: _exitingSequenceAnimation['footer_header'],
        builder: (context, child) {
          double exitingAnimationValue =
              _exitingSequenceAnimation['footer_header'].value;
          return Transform.translate(
            offset: Offset(0, -350 * exitingAnimationValue),
            child: child,
          );
        },
        child: AnimatedBuilder(
            animation: _enteringSequenceAnimation['dropOrangeContainer'],
            builder: (context, _) {
              double animationValue =
                  1 - _enteringSequenceAnimation['dropOrangeContainer'].value;
              double secondaryAniamtionValue = 1 -
                  _enteringSequenceAnimation['secondaryDropOrangeContainer']
                      .value;
              return Transform.translate(
                offset: Offset(0, -350 * animationValue),
                child: Container(
                  height: rspo.screenHeight * 0.45,
                  width: rspo.screenWidth,
                  decoration: BoxDecoration(
                      color: AppTheme.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-0.95, -0.75),
                        child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            _exitingController.forward().then(
                              (_) {
                                onTapGo();
                              },
                            );
                          },
                        ),
                      ),
                      Positioned(
                          top: 210,
                          left: 26,
                          child: Text("Rent Surfing",
                              style: mainTextStyle.copyWith(
                                fontSize: 29,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))),
                      UserAvater(
                        secondaryAniamtionValue: secondaryAniamtionValue,
                      ),
                      Positioned(
                        top: 160,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Transform.translate(
                            offset: Offset(0, -37.0 * secondaryAniamtionValue),
                            child: Text(
                              "Gabriel Estrada",
                              style: mainTextStyle.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
