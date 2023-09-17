import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:database_project/Style/color_schemes.g.dart';
import 'package:database_project/View/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleTapExitWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              DefaultTextStyle(
                style: TextStyle(
                ),
                child: Container(
                  width: double.infinity,
                  color: M3ColorScheme.dark.secondary,
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                  child: DefaultTextStyle(
                    style:  TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: M3ColorScheme.dark.onSecondary
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "로그인하세요",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                size : 30.sp
                              )
                            )
                          ],
                        ),
                        SizedBox(height: 50.h,),
                        Text(
                          "로그인 해서 뮤직 플레이어의\n서비스를 이용해보세요.",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 50,),
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            "회원가입하기",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: M3ColorScheme.dark.onPrimary
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
