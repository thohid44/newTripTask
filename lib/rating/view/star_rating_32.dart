import 'package:bus/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StarRating32 extends StatelessWidget {
  const StarRating32({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
       
        children: [

          Positioned(
            top: 30.h,
            child: CircleAvatar(
         
            backgroundImage: AssetImage("assets/man.jpg",),
          )), 
          Container(
            margin: EdgeInsets.only(top: 40.h),
            height: 200.h, 
            width: 320.w,
            decoration: BoxDecoration(
              color: lightNavyColor
            ),
            child: Column(
              children: [
                SizedBox(height: 60.h,),
                Text("How was th experience?")
              ],
            ),
          )
        ],
      )
    );
  }
}