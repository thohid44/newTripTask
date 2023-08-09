import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyTripsOfferPage extends StatelessWidget {
  const MyTripsOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TripController());
    return Scaffold(
      appBar:customAppBar(),
      body: FutureBuilder(
          future: controller.getMyTripsOffer(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var tripOfferData = snapshot.data.data[index];
                 
                    return Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 190.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: RichText(text:TextSpan(
                                    text: "Start Point: ",
                                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "${tripOfferData.tripStartPoint}" , 
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)
                                      )
                                    ]
                                  ), 
                                  
                                  ),),
                                  SizedBox(height: 10.h,), 
                                  Container(
                                    child: RichText(text:TextSpan(
                                    text: "Destination Point: ",
                                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "${tripOfferData.tripDestination}" , 
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)
                                      )
                                    ]
                                  ), 
                                  
                                  ),),
                                    
                                  

                                  

                                ],
                              ),
                            ),
                            Container(
                              width: 120.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                   Container(
                                  
                                    child:  RichText(text:TextSpan(
                                    text: "Date: ",
                                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "${tripOfferData.tripDate}" , 
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                                      )
                                    ]
                                  ), 
                                  
                                  ),),
                                    
                                  Container(
                                   
                                    child:  RichText(text:TextSpan(
                                    text: "Amount: ",
                                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "${tripOfferData.amount}" , 
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                                      )
                                    ]
                                  ), 
                                  
                                  ),),
                                       Container(
                               
                                    child:  RichText(text:TextSpan(
                                    text: "Accepted: ",
                                    style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                        text: "${tripOfferData.accepted}" , 
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                                      )
                                    ]
                                  ), 
                                  
                                  ),),
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(
                child: CircularProgressIndicator(
              color: navyBlueColor,
            ));
          }),
    );
  }
}
