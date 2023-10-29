import 'package:database_project/Common/ImageUrls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListAddWidget extends StatelessWidget {
  const PlayListAddWidget({super.key, required this.currentIndex, required this.index});

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    var _scale = currentIndex == index ? 1.0 : 0.8;
   // PlaylistLibraryItemData itemData = playListLibraryItemList[index];
    return TweenAnimationBuilder(
        tween: Tween(begin: _scale, end: _scale),
        duration: const Duration(milliseconds: 350),
        child: InkWell(
          onTap: (){
            //Get.to(PlayListPage());
          },
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.network(
                          ImageUrls.playlistCover02,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 20.w),
                            child: Text(
                              "추가",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.sp,
                                  color: Colors.white
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                )
              ],
            ),
          ),
        ),
        builder: (context, double value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        });
  }
}
