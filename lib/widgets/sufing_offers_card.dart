import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

class SurfingOffersCard extends StatelessWidget {
  const SurfingOffersCard({
    Key key,
    this.country = 'USA',
    this.offerText = "Rent Surfing on California",
    this.cost = '72.00',
    this.number = 2,
    this.isSelected = false,
  }) : super(key: key);
  final String country;
  final String offerText;
  final String cost;
  final int number;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: rspo.screenWidth,
      height: 110,
      color: isSelected ? Colors.white : Colors.transparent,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: isSelected ? 50 : 26,
            width: 26,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppTheme.classicBlack
                  : Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                country,
                style: mainTextStyle.copyWith(
                  color: Colors.black12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                offerText,
                style: mainTextStyle.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "form \$" + cost,
                style: mainTextStyle.copyWith(
                  color: Colors.black12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FaIcon(
                Icons.star,
                color:
                    isSelected ? AppTheme.orange : Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 25),
              Text(
                "more",
                style: mainTextStyle.copyWith(
                  color: isSelected ? Colors.black87 : Colors.black12,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
