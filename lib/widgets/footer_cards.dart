import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/sufing_offers_card.dart';

import '../appTheme.dart';

class FooterCards extends StatelessWidget {
  const FooterCards({
    Key key,
    @required SequenceAnimation exitingSequenceAnimation,
    @required SequenceAnimation enteringSequenceAnimation,
  })  : _exitingSequenceAnimation = exitingSequenceAnimation,
        _enteringSequenceAnimation = enteringSequenceAnimation,
        super(key: key);

  final SequenceAnimation _exitingSequenceAnimation;
  final SequenceAnimation _enteringSequenceAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      child: AnimatedBuilder(
        animation: _exitingSequenceAnimation['footer_header'],
        builder: (context, child) {
          double exitingAnimationValue =
              _exitingSequenceAnimation['footer_header'].value;
          return Transform.translate(
            offset: Offset(0, 300 * exitingAnimationValue),
            child: child,
          );
        },
        child: AnimatedBuilder(
          animation: _enteringSequenceAnimation['firstCard'],
          builder: (context, _) {
            double firstAnimation =
                1 - _enteringSequenceAnimation['firstCard'].value;
            double secondAnimation =
                1 - _enteringSequenceAnimation['secondCard'].value;
            double thirdAnimation =
                1 - _enteringSequenceAnimation['thirdCard'].value;
            return Column(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, 300 * firstAnimation),
                  child: SurfingOffersCard(
                      number: 1,
                      cost: '61.00',
                      country: 'Australia',
                      offerText: 'Rent Surfing on Sudney\'s'),
                ),
                Transform.translate(
                    offset: Offset(0, 300 * secondAnimation),
                    child: SurfingOffersCard(isSelected: true)),
                SizedBox(height: 30),
                Transform.translate(
                  offset: Offset(0, 300 * thirdAnimation),
                  child: Container(
                    height: 47,
                    width: 230,
                    decoration: BoxDecoration(
                      color: AppTheme.purplishPink,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          offset: Offset(0, 7),
                          blurRadius: 15,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: AnimatedBuilder(
                      animation:
                          _enteringSequenceAnimation['thirdCardContent1'],
                      builder: (BuildContext context, _) {
                        double wholeOpacityAnimation =
                            _enteringSequenceAnimation['thirdCardContent1']
                                .value;
                        double iconOpacityAnimation =
                            _enteringSequenceAnimation['thirdCardContent2']
                                .value;
                        return Opacity(
                          opacity: wholeOpacityAnimation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "See more",
                                style: mainTextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Transform.scale(
                                          scale: 1,
                                          child: Icon(
                                            FontAwesomeIcons.angleRight,
                                            size: 20,
                                            color: AppTheme.purplishPink
                                                .withOpacity(
                                                    iconOpacityAnimation),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Transform.scale(
                                          scale:
                                              0.98 * (1 - iconOpacityAnimation),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                AppTheme.purplishPink,
                                            radius: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            );
          },
        ),
      ),
    );
  }
}
