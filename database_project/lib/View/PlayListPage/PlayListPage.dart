import 'package:database_project/Common/DubleTapExitWidget.dart';
import 'package:database_project/Model/Music.dart';
import 'package:database_project/Style/color_schemes.g.dart';
import 'package:database_project/View/BottomNavBar/BottomNavBar.dart';
import 'package:database_project/View/CustomBottomNavBar.dart';
import 'package:database_project/View/MusicPlayPage/MusicPlayPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simple_shadow/simple_shadow.dart';

const String tempImage = "https://ibighit.com/bts/images/bts/discography/butter/butter-cover.jpg";
//const String tempImage = "https://ibighit.com/bts/images/bts/discography/butter/butter-cover.jpg";
const String orangeImage = "https://ibighit.com/bts/images/bts/discography/butter-2/butter-2-cover.jpg";
const String newj = "https://marketplace.canva.com/EAExV_SCzfw/1/0/1600w/canva-%EC%B2%AD%EB%A1%9D%EC%83%89-%ED%95%98%EB%8A%98-%EB%B0%B0%EA%B2%BD-%EC%95%84%EC%9D%B4%EC%8A%A4%ED%81%AC%EB%A6%BC-%EC%82%AC%EC%A7%84-%EC%95%A8%EB%B2%94%EC%BB%A4%EB%B2%84-GwDEFZt-cps.jpg";
const String evan = "https://i1.sndcdn.com/artworks-000156787653-tqesbb-t500x500.jpg";

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
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PlayList",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              /*SimpleShadow(
                offset: Offset(0,3),
                sigma: 10,
                opacity: 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    "https://cdn.imweb.me/upload/S2020121847659829d6817/74ef22e4a3dc2.png",
                    width: 300.w,
                    height: 100.w,
                    fit: BoxFit.fitWidth,
                    opacity: AlwaysStoppedAnimation(0.7),
                  ),
                ),
              ),*/
              SizedBox(height: 10.h,),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                  padding: EdgeInsets.fromLTRB(15.w, 0, 10.w, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r) , topRight: Radius.circular(30.r)),
                    //color: Color(0xffEBC7E4)
                  ),
                  child: ListView.builder(
                      itemCount:  10,
                      itemBuilder: (context , index){
                        Music music = Music(id: "id", name: "name", composer: "composer");
                        if(index % 3 == 0) return PlaylistElementWidget(music: music , imageUrl: tempImage,);
                        else if(index % 3 == 1) return PlaylistElementWidget(music: music , imageUrl: orangeImage,);
                        else if(index % 4 == 2) return PlaylistElementWidget(music: music , imageUrl: newj,);
                        else return PlaylistElementWidget(music: music , imageUrl: newj,);
                      }
                  ),
                  /*child: FutureBuilder(
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

                        return ListView.builder(
                          itemCount:  musics.length,
                          itemBuilder: (context , index){
                            if(index % 3 == 0) return PlaylistElementWidget(music: musics[index] , imageUrl: tempImage,);
                            else if(index % 3 == 1) return PlaylistElementWidget(music: musics[index] , imageUrl: orangeImage,);
                            else if(index % 4 == 2) return PlaylistElementWidget(music: musics[index] , imageUrl: newj,);
                            else return PlaylistElementWidget(music: musics[index] , imageUrl: newj,);
                          }
                        );
                      }
                    },
                  ),*/
                ),
              ),
            ],
          )
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class PlaylistElementWidget extends StatelessWidget {
  const PlaylistElementWidget({super.key, required this.music, required this.imageUrl});

  final Music music;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(MusicPlayPage(imageUrl: imageUrl));
      },
      child: Container(
        width: double.infinity,
        height: 75.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                tempImage,
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
                  music.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp
                  ),
                ),
                SizedBox(height: 6.h,),
                Text(
                  music.composer,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: Colors.black54
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );


    return Padding(
      padding: EdgeInsets.fromLTRB(0, 2.5.h, 0, 2.5.h),
      child: ListTile(
        onTap: (){
          Get.to(MusicPlayPage(imageUrl: imageUrl,));
        },
        leading: SizedBox(
          width: 50.w,
          height: 50.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              tempImage,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        ),
        title: Text(
          music.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp
          ),
        ),
        subtitle: Text(
          music.composer,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp
          ),
        ),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.more_horiz,
          ),
        ),
      ),
    );
  }
}
