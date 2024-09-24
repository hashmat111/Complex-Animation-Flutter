import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anim extends StatefulWidget {
  @override
  State<Anim> createState() => _AnimState();
}

class _AnimState extends State<Anim>with TickerProviderStateMixin {

  late AnimationController animationController;// control the animation
  late Animation<double> animation,animation1,animation3,opacityAnimation,scaleAnimation,movementAnimation;//real animation we do with it


  //This code initializes an AnimationController with a 3-second duration,below code
  @override
  void initState() {
    super.initState();
    animationController=AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();



    animation=Tween<double> (begin: 0,end: 2*pi).animate(animationController);// end is 360 degree
    animation1=Tween<double> (begin: 0,end: 2*pi).animate(animationController);// end is 360 degree
    opacityAnimation=Tween<double> (begin: 0,end: 1  ).animate(animationController);// end is 360 degree

    // Scaling effect: from 0.5 (half size) to 1.5 (bigger size)
    scaleAnimation=Tween<double>(begin: 0.5,end: 1.5).animate(animationController);
    movementAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);



    //  animation3=Tween<double> (begin: 0,end: 2 *pi).animate(animationController);// end is 360 degree



  }
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    double radius = 200.0; // Define the radius of the circular motion
    int totalPlanets = 8; // Number of planets you have (Mercury, Venus, Earth)
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
        //  AnimatedBuilder(
        //   animation: opacityAnimation,
        //   child: Image.asset("assets/images/sun.jpeg",  width: 250,
        //     height: 250,
        //     fit: BoxFit.cover,),
        //   builder:(context,child)=>
        //   Opacity(opacity: opacityAnimation.value,
        // //  Transform.rotate(angle: -opacityAnimation.value,
        //
        //   child: child,
        //   ), ),


          // Second container with scaling and rotation only
          // AnimatedBuilder(
          //   animation: animationController,
          //   child: Container(
          //     width: 250,
          //     height: 250,
          //     color: Colors.white,
          //   ),
          //   builder: (context, child) => Transform.scale(
          //     scale: scaleAnimation.value, // Apply scaling
          //     child: Transform.rotate(
          //       angle: animation1.value, // Apply rotation
          //       child: child,
          //     ),
          //   ),
          // ),

          AnimatedBuilder(
            animation: animation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.yellow, Colors.orange.withOpacity(0.5)],
                  stops: [0.5, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.5),
                    spreadRadius: 20,
                    blurRadius: 30,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
            builder: (context, child) => Transform.rotate(
              angle: animation.value,
              child: child,
            ),
          ),

          // AnimatedBuilder(
          //   animation: animation1,
          //   child: Image.asset("assets/images/sunn.jpg",  width: 100,
          //     height: 100,
          //     fit: BoxFit.cover,),
          //   builder:(context,child)=>
          //       Transform.rotate(angle: -animation1.value,
          //         child: child,
          //       ), ),



          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Venus.webp",  width: 180,
              height: 180,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(movementAnimation.value);
              double offsetY = radius * sin(movementAnimation.value);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),
      // forth container with scaling, rotation, and movement
      AnimatedBuilder(
        animation: animationController,
        child: Image.asset("assets/images/Mercury.jpg",  width: 130,
          height: 130,
          fit: BoxFit.cover,),
        builder: (context, child) {

          // Shift Mercury by 2π/totalPlanets radians (for equal spacing)
          double mercuryAngle = movementAnimation.value - (2 * pi / totalPlanets);
          // Movement in a circular path using trigonometry
          double offsetX = radius * cos(mercuryAngle);
          double offsetY = radius * sin(mercuryAngle);

          return Transform.translate(
            offset: Offset(offsetX, offsetY), // Apply circular movement
            // child: Transform.scale(
            //   scale: scaleAnimation.value, // Apply scaling
              child: Transform.rotate(
                angle: animation.value, // Apply rotation
                child: child,
              ),
           // ),

          );

        },


      ),




          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Earth.jpg",  width: 110,
              height: 110,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (4 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),



          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Mars.jpeg",  width: 90,
              height: 90,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (6 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),




          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Jupiter.jpg",  width: 70,
              height: 70,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (8 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),


          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Saturn.png",  width: 50,
              height: 50,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (10 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),


          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Uranus.png",  width: 30,
              height: 30,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (12 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),


          AnimatedBuilder(
            animation: animationController,
            child: Image.asset("assets/images/Neptune.webp",  width: 25,
              height: 25,
              fit: BoxFit.cover,),
            builder: (context, child) {

              // Shift Earth by 4π/totalPlanets radians (for equal spacing)
              double earthAngle = movementAnimation.value - (14 * pi / totalPlanets);
              // Movement in a circular path using trigonometry
              double offsetX = radius * cos(earthAngle);
              double offsetY = radius * sin(earthAngle);

              return Transform.translate(
                offset: Offset(offsetX, offsetY), // Apply circular movement
                // child: Transform.scale(
                //   scale: scaleAnimation.value, // Apply scaling
                child: Transform.rotate(
                  angle: animation.value, // Apply rotation
                  child: child,
                ),
                //  ),


              );
            },


          ),
        ],

      ),





    );
  }
}
