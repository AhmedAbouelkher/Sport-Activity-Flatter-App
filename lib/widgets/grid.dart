import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.red.withOpacity(0.0),
            height: 150,
            width: 280,
          ),
          Positioned(
            left: 40,
            bottom: 0,
            child: SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (int i = 1; i < 10; i += 2)
                    Text(
                      i.toString(),
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 25,
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i = 14; i >= 10; i -= 2)
                    Text(
                      i.toString(),
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i = 0; i < 5; i++)
                    Container(
                      color: Colors.black.withOpacity(0.05),
                      width: 250,
                      height: 2,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
