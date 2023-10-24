import 'package:database_project/Common/ImageUrls.dart';
import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:database_project/View/MusicPlayPage/MusicPlayPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlaylistLibraryItemWidget extends StatelessWidget {
  PlaylistLibraryItemWidget({super.key});

  final PlaylistLibraryItemData itemData = PlaylistLibraryItemData(
      name: "팝송모음",
      imageUrl: ImageUrls.playlistCover01
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Get.to(MusicPlayPage(imageUrl: imageUrl));
      },
      child: Container(
        width: double.infinity,
        height: 75.h,
        padding: EdgeInsets.only(left: 10.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                itemData.imageUrl,
                fit: BoxFit.fill,
                width: 60.h,
                height: 60.h,
              ),
            ),
            SizedBox(width: 20.w,),
            Text(
              itemData.name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
