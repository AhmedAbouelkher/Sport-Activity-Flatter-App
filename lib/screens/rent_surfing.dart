import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/center_chart.dart';
import 'package:sport_activity_dashboard_app/widgets/footer_cards.dart';
import 'package:sport_activity_dashboard_app/widgets/surfing_header.dart';

class RentSurfing extends StatefulWidget {
  @override
  _RentSurfingState createState() => _RentSurfingState();
}

class _RentSurfingState extends State<RentSurfing>
    with TickerProviderStateMixin {
  AnimationController _enteringController;
  SequenceAnimation _enteringSequenceAnimation;
  AnimationController _exitingController;
  SequenceAnimation _exitingSequenceAnimation;
  int rawEnteringDuration;
  int rawExitingDuration;
  Duration _enteringDuration;
  Duration _exitingDuration;

  @override
  void initState() {
    super.initState();

    ///Entering Animation
    rawEnteringDuration = 700;
    _enteringDuration = Duration(milliseconds: rawEnteringDuration);
    _enteringController =
        AnimationController(vsync: this, duration: _enteringDuration);
    _enteringSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(0),
          to: intervel(0.9),
          tag: 'dropOrangeContainer',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(0.7 * 0.75),
          to: intervel(1.2),
          tag: 'secondaryDropOrangeContainer',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(0.7 * 0.85),
          to: intervel(1.4),
          tag: 'chart',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.easeInCubic)),
          from: intervel(0.7 * 0.8),
          to: intervel(4), //4
          tag: 'chart_counter',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
          from: intervel(0),
          to: intervel(0.9),
          tag: 'firstCard',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
          from: intervel(0.2),
          to: intervel(1.1),
          tag: 'secondCard',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
          from: intervel(0.4),
          to: intervel(1.3),
          tag: 'thirdCard',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          from: intervel(1),
          to: intervel(2),
          tag: 'thirdCardContent1',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          from: intervel(1.1),
          to: intervel(2.4),
          tag: 'thirdCardContent2',
        )
        .animate(_enteringController);
    _enteringController.forward();

    ///Exiting Animation
    rawExitingDuration = 200;
    _exitingDuration = Duration(milliseconds: rawEnteringDuration);
    _exitingController =
        AnimationController(vsync: this, duration: _exitingDuration);
    _exitingSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          from: exitingIntervel(0),
          to: exitingIntervel(1),
          tag: 'footer_header',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.easeInCubic)),
          from: exitingIntervel(0.5),
          to: exitingIntervel(1.4),
          tag: 'exiting_chart',
        )
        .animate(_exitingController);
  }

  Duration intervel(double intervel) {
    int _fullDuration = rawEnteringDuration;
    return Duration(milliseconds: (_fullDuration * intervel).round());
  }

  Duration exitingIntervel(double intervel) {
    int _fullDuration = rawExitingDuration;
    return Duration(milliseconds: (_fullDuration * intervel).round());
  }

  void _moveToHomeScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        maintainState: false,
        transitionDuration: Duration(milliseconds: 0),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return HomeScreen();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _enteringController.dispose();
    _exitingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Stack(
        children: <Widget>[
          Header(
            exitingSequenceAnimation: _exitingSequenceAnimation,
            enteringSequenceAnimation: _enteringSequenceAnimation,
            exitingController: _exitingController,
            onTapGo: () => _moveToHomeScreen(context),
          ),
          CenterQuickChart(
            exitingSequenceAnimation: _exitingSequenceAnimation,
            enteringSequenceAnimation: _enteringSequenceAnimation,
          ),
          FooterCards(
            exitingSequenceAnimation: _exitingSequenceAnimation,
            enteringSequenceAnimation: _enteringSequenceAnimation,
          )
        ],
      ),
    );
  }
}
