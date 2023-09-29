import 'package:database_project/Model/Music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MusicChart extends StatelessWidget {
  const MusicChart({super.key});

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
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
      child: Column(
        children: [
          Text(
            "인기차트",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700
            ),
          ),
          FutureBuilder(
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
                return Builder(
                  builder: (context) {
                    List<Widget> musicList = [];

                    for (int i = 0; i < musics.length; i++) {
                      musicList.add(
                        ListTile(
                          title: Text(musics[i].name),
                          subtitle: Text(musics[i].composer),
                        ),
                      );
                    }
                    return Column(
                      children: musicList,
                    );
                  }
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
