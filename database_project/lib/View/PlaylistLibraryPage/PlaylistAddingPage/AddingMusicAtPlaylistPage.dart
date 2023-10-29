import 'package:database_project/Controller/AddingMusicAtPlaylistController.dart';
import 'package:database_project/Controller/PlaylistLibraryController.dart';
import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:database_project/View/PlaylistLibraryPage/PlaylistAddingPage/AddingMusicAtPlaylistItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddingMusicAtPlaylistPage extends StatefulWidget {
  const AddingMusicAtPlaylistPage({super.key});

  @override
  State<AddingMusicAtPlaylistPage> createState() => _AddingMusicAtPlaylistPageState();
}

class _AddingMusicAtPlaylistPageState extends State<AddingMusicAtPlaylistPage> {
  int _currentIndex = 0;

  final _pageViewController = PageController(initialPage: 0, viewportFraction: 0.75);
  AddingMusicAtPlaylistController controller = Get.put(AddingMusicAtPlaylistController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PlaylistLibraryController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h,),
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
            SizedBox(height: 20.h,),
            GetX<AddingMusicAtPlaylistController>(
              builder: (controller) {
                if(controller.playlistLibraryItemData.isEmpty){
                  return SizedBox();
                }
                else{
                  final List<PlaylistLibraryItemData> playlistItemList = controller.playlistLibraryItemData;
                  final List<Widget> playlistItemWidgetList = playlistItemList.map((e) =>
                      AddingMusicAtPlaylistItemWidget(
                          playlist: e
                      )
                  ).toList();

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                      child: Center(
                        child: ListView(
                          children: playlistItemWidgetList,
                        ),
                      ),
                    ),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
