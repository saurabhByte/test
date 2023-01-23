import 'package:flutter/material.dart';
import 'package:newtask/provider/heading_provider.dart';
import 'package:newtask/screens/home.dart';
import 'package:newtask/screens/odi.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HeadingProvider()),
      ],
      child: const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}


