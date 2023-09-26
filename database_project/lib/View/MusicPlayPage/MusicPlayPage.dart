import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

const String tempImage = "https://ibighit.com/bts/images/bts/discography/butter/butter-cover.jpg";


class MusicPlayPage extends StatelessWidget {
  const MusicPlayPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30.sp,
                  ),
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.w,),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: Transform.rotate(
                angle: 0 * pi / 180,
                child: WidgetMask(
                  mask: Image.network(
                    tempImage,
                  ),
                  child: Image.asset("assets/images/disk.png"),
                  blendMode: BlendMode.srcATop,
                 /* mask: Image.asset("assets/images/disk.png"),
                  child: Image.network(
                    tempImage,
                  ),*/
                  childSaveLayer: true,
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Text(
              "Life is Beautiful",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              "Drake ft.soon paul",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w,0,30.w,0),
              child: ProgressBar(
                progress: Duration(seconds: 62),
                buffered: Duration(seconds: 140),
                total: Duration(seconds: 227),
                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
                progressBarColor: Colors.yellow,
                baseBarColor: Colors.black.withOpacity(0.24),
                bufferedBarColor: Colors.black.withOpacity(0.24),
                thumbColor: Colors.black,
                barHeight: 5.0,
                thumbRadius: 5.0,
              ),
            ),
            Expanded(child: SizedBox()),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){

                  },
                  icon: Center(
                    child: Icon(
                      Icons.skip_previous_rounded,
                      size: 45.sp,
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 45.sp,
                  ),
                ),
                SizedBox(width: 20.w,),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){

                  },
                  icon: Center(
                    child: Icon(
                      Icons.skip_next_rounded,
                      size: 45.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h,)
          ],
        ),
      ),
    );
  }
}
