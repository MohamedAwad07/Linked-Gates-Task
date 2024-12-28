import 'package:flutter/material.dart';

 // Assuming your ApiService is in api_service.dart

void main() async {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Request Example'),
        ),
        body: Center(
          child: Text('Check your console for API response'),
        ),
      ),
    );
  }
}
