import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 45.2.w, bottom: 0),
      child: Column(
        children: [
          SizedBox(
            height: 230.h,
            child:  Column(
               mainAxisSize: MainAxisSize.max, 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text("Profile", style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500
                  )),
                   SizedBox(
                    height: 10.h,
                  ),
                CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.ibukunoluwa.path),
                    radius: 40.w,
                ),
                 SizedBox(
                    height: 10.h,
                  ),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Ibukunoluwa Akintobi",
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w500) ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("102 St Ports, New York"),
                            Icon(Icons.keyboard_arrow_down_rounded),
                          ],
                        ),
                        Text("458-419-1891")
                      ],
                    ),
              ],
            )
          ),
          SizedBox(height: 60.h,),
          SizedBox(
            height: 200.h,
            child: Column(
               mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                  SvgPicture.asset(Assets.svgs.creditCard,
                      semanticsLabel: 'Card'),
                    SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment methods",  style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400)), 
                      Text("2 cards added")
                    ],
                  )
                ]),
                 Row(
                    children: [
                       SvgPicture.asset(Assets.svgs.address,
                      semanticsLabel: 'Address'),
                      SizedBox(
                    width: 30,
                  ),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery address",  style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400)),
                      Text("102nd St Ports, New York")
                    ],
                  )
                ]),
                 Row(
                  children: [
                   SvgPicture.asset(Assets.svgs.settings,
                      semanticsLabel: 'Settings'),
                      SizedBox(
                    width: 30,
                  ),
            Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Settings",  style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400)),
                      Text("Notification | FAQ | Contact")
                    ],
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
