import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:response/response.dart';
import 'package:sport_activity_dashboard_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Response(
      child: MaterialApp(
        title: 'Sport Acitivty',
        theme: ThemeData(
          textTheme: GoogleFonts.josefinSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
