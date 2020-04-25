import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

class DayWeekMonthDashboard extends StatelessWidget {
  DayWeekMonthDashboard({
    Key key,
    this.animation,
    this.lateAnimation,
  }) : super(key: key);
  final Animation animation;
  final Animation lateAnimation;
  final List<Widget> _widgets = [
    DayWeekMonth(
      title: 'Day',
    ),
    DayWeekMonth(
      title: 'Week',
      isWeek: true,
    ),
    DayWeekMonth(
      title: 'Month',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        double fastAnimation = animation.value;
        double slowAnimation = lateAnimation.value;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 220,
              height: 33,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _widgets.length,
                itemBuilder: (context, index) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        0, (1 - animation.value) * (index + 1) * -30, 0),
                    child: Opacity(
                      opacity: animation.value,
                      child: _widgets[index],
                    ),
                  );
                },
              ),
            ),
            CircleAvatar(
              backgroundColor: AppTheme.classicBlack,
              radius: 25,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Transform.scale(
                        scale: slowAnimation,
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: 1 - fastAnimation,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF9F9F9),
                          radius: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class DayWeekMonth extends StatelessWidget {
  const DayWeekMonth({
    Key key,
    this.title,
    this.isWeek = false,
  }) : super(key: key);
  final String title;
  final bool isWeek;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: mainTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: isWeek ? Colors.black87 : Colors.black12,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            radius: 3,
            backgroundColor: isWeek ? Colors.black : Colors.transparent,
          )
        ],
      ),
    );
  }
}
