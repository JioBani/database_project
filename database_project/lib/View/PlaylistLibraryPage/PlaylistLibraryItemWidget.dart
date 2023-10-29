import 'package:database_project/Common/ImageUrls.dart';
import 'package:database_project/Model/Music.dart';
import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:database_project/Style/ShadowPalette.dart';
import 'package:database_project/View/MusicElementWidget.dart';
import 'package:database_project/View/MusicPlayPage/MusicPlayPage.dart';
import 'package:database_project/View/PlayListPage/PlayListPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum MenuType {
  remove
}



class PlaylistLibraryItemWidget extends StatefulWidget {
  PlaylistLibraryItemWidget({super.key, required this.currentIndex, required this.index, required this.playlist});
  final int currentIndex;
  final int index;
  final PlaylistLibraryItemData playlist;

  @override
  State<PlaylistLibraryItemWidget> createState() => _PlaylistLibraryItemWidgetState();
}

class _PlaylistLibraryItemWidgetState extends State<PlaylistLibraryItemWidget> {

  @override
  Widget build(BuildContext context) {

    var _scale = widget.currentIndex == widget.index ? 1.0 : 0.8;

    return TweenAnimationBuilder(
        tween: Tween(begin: _scale, end: _scale),
        duration: const Duration(milliseconds: 350),
        child: InkWell(
          onTap: (){
            Get.to(PlayListPage(playlistData: widget.playlist,));
          },
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [ShadowPalette.defaultShadowLight]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
                            ImageUrls.playlistCover02,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 20.w),
                            child: Text(
                              widget.playlist.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.sp,
                                  color: Colors.white
                              ),
                            ),
                          )
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 15.w, 15.w),
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                ShadowPalette.defaultShadowLight,
                              ]
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 32.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.w, top: 8.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<MenuType>(
                            color: Colors.white,
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 32.sp,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.r))
                            ),
                            onSelected: (MenuType result){
                              final snackBar = SnackBar(
                                content: Text("플레이리스트 삭제"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            itemBuilder: (BuildContext buildContext) {
                              return [
                                for (final value in MenuType.values)
                                  PopupMenuItem(
                                    value: value,
                                    child: Center(
                                      child: Text(
                                        "삭제",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp
                                        ),
                                      )
                                    ),
                                    height: 25.h,
                                  )
                              ];
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h,),
                Expanded(
                  child: Column(
                    children: [
                      MusicElementWidget(music: widget.playlist.musicList[0],imageUrl:  widget.playlist.musicList[0].imageUrl, ),
                      MusicElementWidget(music:  widget.playlist.musicList[0],imageUrl:  widget.playlist.musicList[0].imageUrl, ),
                      MusicElementWidget(music:  widget.playlist.musicList[0],imageUrl:  widget.playlist.musicList[0].imageUrl, ),
                    ],
                  ),
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
