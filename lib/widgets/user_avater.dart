import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

class UserAvater extends StatelessWidget {
  const UserAvater({
    Key key,
    @required this.secondaryAniamtionValue,
  }) : super(key: key);

  final double secondaryAniamtionValue;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 55,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: Transform.translate(
          offset: Offset(
            0,
            -45.0 * secondaryAniamtionValue,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 91,
                width: 91,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.amberAccent,
                    width: 5,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/man_avater_3.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "23",
                      style: GoogleFonts.lato().copyWith(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
