import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/blur_container.dart';
import 'package:sport_activity_dashboard_app/widgets/progress_bar.dart';

class ActivityCalender extends StatelessWidget {
  const ActivityCalender({
    Key key,
    @required SequenceAnimation sequenceAnimation,
  })  : _sequenceAnimation = sequenceAnimation,
        super(key: key);

  final SequenceAnimation _sequenceAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sequenceAnimation['main1'],
      builder: (context, child) {
        double animationValue = 1 - _sequenceAnimation['main1'].value;

        double _animateBar(double finalValue) =>
            100 - (100 - finalValue) * _sequenceAnimation['thumbnails'].value;

        return BlurContainer(
          height: 220,
          width: rspo.screenWidth,
          angleX: -90.0 * animationValue,
          sigmaX: 5 * animationValue,
          sigmaY: 5 * animationValue,
          child: Container(
            height: 220,
            width: rspo.screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    offset: Offset(0, 7),
                    blurRadius: 15,
                    spreadRadius: 0,
                  )
                ]),
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DayActivity(
                          dayName: 'Mo', currentProgressValue: _animateBar(30)),
                      DayActivity(
                          dayName: 'Tu', currentProgressValue: _animateBar(25)),
                      DayActivity(
                          dayName: 'We',
                          currentProgressValue: _animateBar(90),
                          progressBarColor: AppTheme.orange,
                          dayNameColor: Colors.black),
                      DayActivity(
                          dayName: 'Tu', currentProgressValue: _animateBar(27)),
                      DayActivity(
                          dayName: 'Fr', currentProgressValue: _animateBar(40)),
                      DayActivity(
                          dayName: 'Sa', currentProgressValue: _animateBar(65)),
                      DayActivity(
                          dayName: 'Su',
                          currentProgressValue: _animateBar(75),
                          progressBarColor: AppTheme.orange,
                          dayNameColor: Colors.black)
                    ])
              ],
            ),
          ),
        );
      },
    );
  }
}

class DayActivity extends StatelessWidget {
  const DayActivity({
    Key key,
    this.dayName = 'Mo',
    this.fontSize = 16,
    this.dayNameColor = Colors.black26,
    this.currentProgressValue = 80,
    this.progressBarColor = AppTheme.classicBlack,
  }) : super(key: key);
  final String dayName;
  final double fontSize;
  final Color dayNameColor;
  final double currentProgressValue;
  final Color progressBarColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          dayName,
          style: mainTextStyle.copyWith(
            color: dayNameColor,
            fontSize: fontSize,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 140,
          child: FAProgressBar(
            maxValue: 100.0,
            currentValue: currentProgressValue,
            size: 6,
            backgroundColor: Colors.grey.withOpacity(0.07),
            progressColor: progressBarColor,
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            animatedDuration: Duration(milliseconds: 0),
          ),
        ),
      ],
    );
  }
}
