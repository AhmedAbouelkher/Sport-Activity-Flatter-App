import 'dart:ui';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:response/response.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/widgets/acitviy_points.dart';
import 'package:sport_activity_dashboard_app/widgets/activity_calender.dart';
import 'package:sport_activity_dashboard_app/widgets/appBar.dart';
import 'package:sport_activity_dashboard_app/widgets/categories.dart';
import 'package:sport_activity_dashboard_app/widgets/day_week_dashboard.dart';
import 'package:sport_activity_dashboard_app/widgets/rental_equipment.dart';

var rspo = ResponseUI();

TextStyle mainTextStyle = AppTheme.mainTextTheme;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<HomeScreen> {
  AnimationController _controller;
  SequenceAnimation _sequenceAnimation;
  int rawDuration;
  Duration _duration;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();

    rawDuration = 600;
    _duration = Duration(milliseconds: rawDuration);
    _controller = AnimationController(vsync: this, duration: _duration);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(0),
          to: intervel(1),
          tag: 'appBar1',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(0.5),
          to: intervel(1),
          tag: 'appBar2',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(0.1),
          to: intervel(1),
          tag: 'categorys1',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(0.5),
          to: intervel(1),
          tag: 'categorys2',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(1.2),
          to: intervel(1.5),
          tag: 'categorys3',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(0.8),
          to: intervel(1.5),
          tag: 'main1',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(1.5),
          to: intervel(2),
          tag: 'main2',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1),
          from: intervel(2),
          to: intervel(2.5),
          tag: 'superLate',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 2.463)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(1.2),
          to: intervel(4), //4
          tag: 'activityNumber',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(1),
          to: intervel(2.25),
          tag: 'thumbnails',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.fastOutSlowIn)),
          from: intervel(1.5),
          to: intervel(2.3),
          tag: 'avtivityBars',
        )
        .animate(_controller);
  }

  bool isReversed = false;
  Duration intervel(double intervel) {
    int _fullDuration = rawDuration;
    return Duration(milliseconds: (_fullDuration * intervel).round());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Equipmant> _rentalEquipments = [
    Equipmant(equipmentName: 'surfing_1.jpg'),
    Equipmant(equipmentName: 'snowboard.jpg'),
    Equipmant(equipmentName: 'skiing_1.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  CustomAppBar(
                    animation: _sequenceAnimation['appBar1'],
                    slowerAnimation: _sequenceAnimation['appBar2'],
                    animationInitialValue: -80,
                    slowerAnimationInitialValue: -80,
                  ),
                  SizedBox(height: 30),
                  Categories(
                    masterOpacityAnimation: _sequenceAnimation['categorys1'],
                    changgingShapeAnimation: _sequenceAnimation['categorys2'],
                    textOpacityAnimation: _sequenceAnimation['categorys3'],
                  ),
                  SizedBox(height: 35),
                  ActiviyPoints(
                    animation: _sequenceAnimation['main1'],
                    counterAnimation: _sequenceAnimation['activityNumber'],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 290,
                    width: rspo.screenWidth,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DayWeekMonthDashboard(
                            animation: _sequenceAnimation['main1'],
                            lateAnimation: _sequenceAnimation['superLate'],
                          ),
                        ),
                        ActivityCalender(sequenceAnimation: _sequenceAnimation),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: null,
              child: RentalEquipmentThumbnails(
                  sequenceAnimation: _sequenceAnimation,
                  rentalEquipments: _rentalEquipments),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _controller.forward();
  }
}
