import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:database_project/Model/Music.dart';
import 'package:database_project/Style/color_schemes.g.dart';
import 'package:database_project/View/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String tempImage = "https://i.namu.wiki/i/-elQj1PY77ZvaYOvP-RxfqDn_LH7SYjor-WOtC9SGoX1hJdS0FWnPZ91l3Rz12yFWAMQgq70Dqd-JxXMzyK1764y8BIZZEiBnfnhqf4nyizgX4PTB3pyBC9BbV63z_HAgmHcBgTRQfzifr-qCRyIlg.webp";

class PlayListPage extends StatelessWidget {
  const PlayListPage({super.key});

  Future<List<Music>> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:80/index.php'));

    if (response.statusCode == 200) {
      // JSON 데이터 파싱하여 Music 객체 리스트로 변환
      final jsonData = json.decode(response.body) as List;
      return jsonData.map((json) => Music.fromJson(json)).toList();
    } else {
      throw Exception('데이터 가져오기 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapExitWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "플레이리스트",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: M3ColorScheme.dark.onPrimary
              ),
            ),
          ),
          backgroundColor: M3ColorScheme.dark.primary,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // 데이터를 아직 받아오지 못한 경우 로딩 표시
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // 오류가 발생한 경우 오류 메시지 표시
                  return Center(child: Text('오류: ${snapshot.error}'));
                } else {
                  List<Music> musics = snapshot.data!;
                  // 데이터를 받아와서 ListView에 표시

                  return Expanded(
                    child: ListView.builder(
                      itemCount:  musics.length,
                      itemBuilder: (context , index){
                        return PlaylistElementWidget(music: musics[index]);
                      }
                    ),
                  );
                }
              },
            ),
          )
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}

class PlaylistElementWidget extends StatelessWidget {
  const PlaylistElementWidget({super.key, required this.music});

  final Music music;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        tempImage,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
      title: Text(
        music.name,
      ),
      subtitle: Text(
        music.composer,
      ),
      trailing: IconButton(
        onPressed: (){},
        icon: Icon(
          Icons.more_horiz,
        ),
      ),
    );
  }
}
