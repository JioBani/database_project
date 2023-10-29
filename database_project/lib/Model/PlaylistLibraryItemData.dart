import 'package:database_project/Common/ImageUrls.dart';
import 'package:logger/logger.dart';
import 'Music.dart';

class PlaylistLibraryItemData{
   String name;
   String imageUrl;
   List<Music> musicList;

   PlaylistLibraryItemData({required this.name , required this.imageUrl , required this.musicList});

   static PlaylistLibraryItemData testData(){
      return PlaylistLibraryItemData(
         name: "테스트",
         imageUrl: ImageUrls.playlistCover01,
         musicList: [
            Music.butter(),
            Music.butter(),
            Music.butter(),
            Music.butter(),
            Music.butter(),
            Music.butter(),
            Music.butter(),
            Music.butter(),
         ]
      );
   }

   factory PlaylistLibraryItemData.fromJson(Map<String, dynamic> json){
     Logger().i(json);
     List<dynamic> musicList = json['musicList'];



     return PlaylistLibraryItemData(
        name: json['name'],
        imageUrl: json['imageUrl'],
        musicList: musicList.map((e) => Music.fromJson(e)).toList()
     );
   }
}