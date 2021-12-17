import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'explore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key  key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
        visualDensity:VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(

        ),
        
      ),
      home:Explore(),
    );
  }
}
