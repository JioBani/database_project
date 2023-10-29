import 'package:database_project/Common/ImageUrls.dart';
import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:database_project/Style/ShadowPalette.dart';
import 'package:database_project/View/MusicElementWidget.dart';
import 'package:database_project/View/PlayListPage/PlayListPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingMusicAtPlaylistItemWidget extends StatefulWidget {
  const AddingMusicAtPlaylistItemWidget({super.key, required this.playlist});
  final PlaylistLibraryItemData playlist;

  @override
  State<AddingMusicAtPlaylistItemWidget> createState() => _AddingMusicAtPlaylistItemWidgetState();
}

class _AddingMusicAtPlaylistItemWidgetState extends State<AddingMusicAtPlaylistItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 75.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                ImageUrls.coverImage01_butter,
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
                  widget.playlist.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
