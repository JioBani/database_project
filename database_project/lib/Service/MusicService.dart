import 'package:database_project/Model/PlaylistLibraryItemData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MusicService{

  static Future<List<PlaylistLibraryItemData>> getPlaylistLibraryData(String userId) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:80/playlist.json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      return jsonData.map((e) => PlaylistLibraryItemData.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}