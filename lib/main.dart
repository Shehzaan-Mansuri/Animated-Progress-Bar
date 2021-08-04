import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> with SingleTickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {

      });
    });

    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: LiquidLinearProgressIndicator(
                borderRadius: 20.0,
                value: animationController.value,
                valueColor: AlwaysStoppedAnimation(Colors.green),
                center: Text('${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                direction: Axis.horizontal,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            Container(
              height: 175,
              width: 175,
              child: LiquidCircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
                value: animationController.value,
                center: Text('${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),),
                borderColor: Colors.black,
                borderWidth: 1.0,
                direction: Axis.vertical,
              ),
            ),

            Container(
              //width: double.infinity,
              child: LiquidCustomProgressIndicator(
                direction: Axis.vertical,
                shapePath: _buildHeartPath(),
                center: Text('${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: animationController.value,
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }
}






