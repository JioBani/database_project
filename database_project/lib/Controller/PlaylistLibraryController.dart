import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:database_project/Service/MusicService.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PlaylistLibraryController extends GetxController {

    final RxList<PlaylistLibraryItemData> playlistLibraryItemData = RxList();

    @override void onInit() {
      super.onInit();
      fetchData();
    }

    @override
    void onClose() {
      super.onClose();
    }

    Future<void> fetchData() async {
      playlistLibraryItemData.value = await MusicService.getPlaylistLibraryData("temp");
    }
}