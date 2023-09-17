import 'package:database_project/Style/ShadowPalette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "추천 장르",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                ),
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenrePanelWidget(),
              GenrePanelWidget(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenrePanelWidget(),
              GenrePanelWidget(),
            ],
          )
        ],
      ),
    );
  }
}

class GenrePanelWidget extends StatelessWidget {
  const GenrePanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Material(
          elevation: 1,
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
              child: Text(
                "Indie",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

