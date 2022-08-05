import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;

  StaggerAnimation({Key? key, required this.controller}) : 
    buttomSqueeze = Tween(
      begin: 320.0,
      end: 60.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.0, 0.150),
      )
    ), 
    buttomZoomOut = Tween(
      begin: 60.0,
      end: 1000.0,
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.5, 1, curve: Curves.bounceOut),
      )
    )
    ,super(key: key);

  final Animation<double> buttomSqueeze;

  final Animation<double> buttomZoomOut;

    Widget _buildAnimation(BuildContext context, Widget? child){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: buttomZoomOut.value <= 70 ?
         Container(
          width: buttomSqueeze.value,
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(247, 64, 106, 1),
            borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),
          child: _buildInside(context)
        ) 
        : 
        Container(
          width: buttomZoomOut.value,
          height: buttomZoomOut.value,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 64, 106, 1),
            shape: buttomZoomOut.value < 500 ? BoxShape.circle : BoxShape.rectangle,
          ),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context){
    if(buttomSqueeze.value > 75){
      return const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3
            ),
          );
    } else {
      return const CircularProgressIndicator(
        valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}