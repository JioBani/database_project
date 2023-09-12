import 'package:database_project/View/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logger/logger.dart';

import 'CustomSearchBar.dart';

class Music {
  final String id;
  final String name;
  final String composer;

  Music({
    required this.id,
    required this.name,
    required this.composer,
  });

  // JSON 데이터를 Music 객체로 변환하는 팩토리 메서드
  factory Music.fromJson(Map<String, dynamic> json) {
    Logger().i(json);
    return Music(
      id: json['id'] as String,
      name: json['name'] as String,
      composer: json['composer'] as String,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON 데이터 표시'),
      ),
      body: Column(
        children: [
          CustomSearchBar(),
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: musics.length,
                    itemBuilder: (context, index) {
                      Music music = musics[index];
                      return ListTile(
                        title: Text(music.name),
                        subtitle: Text(music.composer),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
