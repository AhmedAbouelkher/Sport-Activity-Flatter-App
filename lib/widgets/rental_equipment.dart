import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:sport_activity_dashboard_app/appTheme.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';
import 'package:sport_activity_dashboard_app/widgets/blur_container.dart';

class RentalEquipmentThumbnails extends StatelessWidget {
  const RentalEquipmentThumbnails({
    Key key,
    @required SequenceAnimation sequenceAnimation,
    @required List<Equipmant> rentalEquipments,
  })  : _sequenceAnimation = sequenceAnimation,
        _rentalEquipments = rentalEquipments,
        super(key: key);

  final SequenceAnimation _sequenceAnimation;
  final List<Equipmant> _rentalEquipments;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sequenceAnimation['categorys1'],
      builder: (context, _) {
        double animationValue = _sequenceAnimation['categorys1'].value;
        double thumbnailsAniamtion = 1 - _sequenceAnimation['thumbnails'].value;
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, 200 * (1 - animationValue)),
              child: Container(
                height: 200,
                width: rspo.screenWidth,
                decoration: BoxDecoration(
                  color: AppTheme.purplishPink,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45),
                  ),
                ),
                padding: EdgeInsets.only(top: 25, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Transform.translate(
                        offset: Offset(-200 * (1 - animationValue), 0),
                        child: Text(
                          "Rental equipment",
                          style: mainTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 60,
              child: Transform.translate(
                offset: Offset(0, 30 * thumbnailsAniamtion),
                child: SizedBox(
                  height: 125,
                  child: ListView.builder(
                      itemCount: _rentalEquipments.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var equipment = _rentalEquipments[index];
                        return BlurContainer(
                          height: 125,
                          width: 150,
                          sigmaX: 5 * thumbnailsAniamtion,
                          sigmaY: 5 * thumbnailsAniamtion,
                          angleX: -90 * thumbnailsAniamtion * (index + 1),
                          setEntryV: 0.001,
                          child: EquipmentThumbnail(
                              equipmentName: equipment.equipmentName),
                        );
                      }),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class Equipmant {
  Equipmant({
    this.height,
    this.width,
    this.equipmentName,
  });
  final double height;
  final double width;
  final String equipmentName;
}

class EquipmentThumbnail extends StatelessWidget {
  const EquipmentThumbnail({
    Key key,
    this.height,
    this.width,
    this.equipmentName,
  }) : super(key: key);
  final double height;
  final double width;
  final String equipmentName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 125,
      width: width ?? 150,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          "assets/images/$equipmentName",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
