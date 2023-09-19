import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "회원가입",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            CustomInputFieldWidget(content: "이름",),
            SizedBox(height: 20.h,),
            CustomInputFieldWidget(content: "아이디",),
            SizedBox(height: 20.h,),
            CustomInputFieldWidget(content: "생년월일",),
            SizedBox(height: 20.h,),
            GenderSelectWidget()
          ],
        ),
      ),
    );
  }
}

class CustomInputFieldWidget extends StatelessWidget {
  const CustomInputFieldWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w ,bottom: 10.h),
            child: Text(
              content ,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
          child: TextField(
            decoration: InputDecoration(
              labelText: content,
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class GenderSelectWidget extends StatefulWidget {
  const GenderSelectWidget({super.key});

  @override
  State<GenderSelectWidget> createState() => _GenderSelectWidgetState();
}

class _GenderSelectWidgetState extends State<GenderSelectWidget> {
  String? selectedGender;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            "성별" ,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp
            ),
          ),
        ),
        genderRadioListTile('남자'),
        genderRadioListTile('여자'),
        genderRadioListTile('기타'),
      ],
    );
  }

  Widget genderRadioListTile(String value) {
    return Expanded(
      child: RadioListTile<String>(
        title: Text(value),
        value: value,
        groupValue: selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;
          });
        },
      ),
    );
  }
}


