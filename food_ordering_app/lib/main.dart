import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(FoodrApp());
}

class FoodrApp extends StatelessWidget {
  const FoodrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenUtilInit(
        minTextAdapt: true,
        designSize: Size(393, 852),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage()
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(),
      ),
      body: Placeholder() 
    );
  }
}


