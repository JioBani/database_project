
import 'package:database_project/Model/Music.dart';
import 'package:database_project/View/MusicPlayPage/MusicPlayPage.dart';
import 'package:database_project/View/PlaylistLibraryPage/PlaylistAddingPage/AddingMusicAtPlaylistPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
const String tempImage = "https://ibighit.com/bts/images/bts/discography/butter/butter-cover.jpg";

enum MenuType{
  add
}

class MusicElementWidget extends StatelessWidget {
  const MusicElementWidget({super.key, required this.music, required this.imageUrl});

  final Music music;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(MusicPlayPage(imageUrl: imageUrl));
      },
      child: Container(
        width: double.infinity,
        height: 75.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                tempImage,
                fit: BoxFit.fill,
                width: 60.h,
                height: 60.h,
              ),
            ),
            SizedBox(width: 20.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  music.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp
                  ),
                ),
                SizedBox(height: 6.h,),
                Text(
                  music.composer,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: Colors.black54
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            PopupMenuButton<MenuType>(
              color: Colors.white,
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 25.sp,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r))
              ),
              onSelected: (MenuType result){
                Get.to(AddingMusicAtPlaylistPage());
              },
              itemBuilder: (BuildContext buildContext) {
                return [
                  for (final value in MenuType.values)
                    PopupMenuItem(
                      value: value,
                      child: Center(
                          child: Text(
                            "플레이리스트에 추가",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp
                            ),
                          )
                      ),
                      height: 32.h,
                    )
                ];
              },
              elevation: 4,
            ),
            SizedBox(width: 5.w,)
          ],
        ),
      ),
    );
  }
}
