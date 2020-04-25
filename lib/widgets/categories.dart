import 'package:flutter/material.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/screens/rent_surfing.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    this.textOpacityAnimation,
    this.masterOpacityAnimation,
    this.changgingShapeAnimation,
  }) : super(key: key);
  final Animation textOpacityAnimation;
  final Animation masterOpacityAnimation;
  final Animation changgingShapeAnimation;

  void _moveToRentSurfing(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        maintainState: false,
        transitionDuration: Duration(milliseconds: 200),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return RentSurfing();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: masterOpacityAnimation,
        builder: (context, child) {
          double titlesOpacity = textOpacityAnimation.value;
          double mainShape = changgingShapeAnimation.value;
          double masterOpacityScaling = masterOpacityAnimation.value;
          return Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _moveToRentSurfing(context),
                child: Opacity(
                  opacity: masterOpacityScaling,
                  child: Container(
                    height: 40,
                    width: 40 + (100 - 35.0) * mainShape,
                    decoration: BoxDecoration(
                      color: AppTheme.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: titlesOpacity,
                              child: Text(
                                "Surfing",
                                style: mainTextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: 1,
                              child: CircleAvatar(
                                radius: 19 * (1 - masterOpacityScaling),
                                backgroundColor: Color(0xffF9F9F9),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Opacity(
                opacity: titlesOpacity,
                child: Text(
                  "Snowboard",
                  style: mainTextStyle.copyWith(
                    fontSize: 17,
                    color: Colors.black12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              Opacity(
                opacity: titlesOpacity,
                child: Text(
                  "Skiing",
                  style: mainTextStyle.copyWith(
                    fontSize: 17,
                    color: Colors.black12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
            ],
          );
        });
  }
}
