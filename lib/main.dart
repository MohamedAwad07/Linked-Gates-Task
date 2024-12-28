import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkedgates_task/features/home/presentation/screens/home.dart';

// Assuming your ApiService is in api_service.dart

void main() async {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define a default text color
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.ysabeauSc().fontFamily,
            color: Colors.black,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
