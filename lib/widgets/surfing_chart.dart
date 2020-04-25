import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

import '../appTheme.dart';
import 'grid.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key key,
    @required this.isPaused,
    this.counter = 0.0,
  }) : super(key: key);

  final bool isPaused;
  final double counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: rspo.screenWidth - 80,
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
      padding: EdgeInsets.all(20),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Grid(),
          Positioned(
            left: 30,
            bottom: 30,
            child: SizedBox(
              height: 105,
              width: 200,
              child: FlareActor(
                'assets/chart_animation_v4.flr',
                alignment: Alignment.center,
                animation: 'line',
                fit: BoxFit.contain,
                isPaused: isPaused,
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: 0,
            child: Container(
              height: 33,
              width: 55,
              decoration: BoxDecoration(
                  color: AppTheme.purplishPink,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      offset: Offset(0, 7),
                      blurRadius: 15,
                      spreadRadius: 0,
                    )
                  ]),
              child: Center(
                child: Text(
                  counter.toStringAsFixed(1),
                  style: GoogleFonts.lato().copyWith(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
