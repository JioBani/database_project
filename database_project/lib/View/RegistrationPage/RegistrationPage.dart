import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleTapExitWidget(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "회원가입",
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [

              ],
            ),
          ),
        )
    );
  }
}
