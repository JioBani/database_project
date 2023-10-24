import 'package:database_project/View/BottomNavBar/BottomNavBar.dart';
import 'package:database_project/View/PlaylistLibraryPage/PlaylistLibraryItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaylistLibraryPage extends StatelessWidget {
  const PlaylistLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Playlist",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Expanded(
              child: ListView(
                children: [
                  PlaylistLibraryItemWidget(),
                ],
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
