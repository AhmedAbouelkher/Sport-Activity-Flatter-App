import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

class ActiviyPoints extends StatelessWidget {
  ActiviyPoints({
    Key key,
    this.counterAnimation,
    this.animation,
  }) : super(key: key);
  final Animation counterAnimation;
  final Animation animation;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AnimatedBuilder(
            animation: counterAnimation,
            builder: (context, _) {
              double rawCounter = counterAnimation.value as double;
              String counter = rawCounter.toStringAsFixed(3);
              return Opacity(
                opacity: animation.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      counter,
                      style: GoogleFonts.lato().copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'activity',
                      style: mainTextStyle.copyWith(
                        fontSize: 17,
                        color: Colors.black12,
                      ),
                    ),
                  ],
                ),
              );
            }),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
          child: Row(
            children: <Widget>[
              Text(
                "profile",
                style: mainTextStyle.copyWith(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 7),
              FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
