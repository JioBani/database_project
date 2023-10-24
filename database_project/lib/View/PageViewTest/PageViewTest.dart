import 'package:card_swiper/card_swiper.dart';
import 'package:database_project/Common/ImageUrls.dart';
import 'package:database_project/Style/ShadowPalette.dart';
import 'package:database_project/View/HomePage/CustomSearchBar.dart';
import 'package:database_project/View/HomePage/MusicChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewTest extends StatefulWidget {
  const PageViewTest({super.key});

  @override
  State<PageViewTest> createState() => _PageViewTestState();
}

class _PageViewTestState extends State<PageViewTest> {

  int _currentIndex = 0;

  final _pageViewController =
  PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: new LayoutBuilder(builder: (context, constraint) {
              return new Swiper(
                loop: true,
                pagination: new SwiperPagination(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      ImageUrls.playlistCover02,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                viewportFraction: 0.8,
                scale: 0.9,
                layout: SwiperLayout.STACK,
                itemWidth: constraint.biggest.width*0.8,
                itemHeight: constraint.biggest.height*0.8,
                index: 1,
              );
            })
        ),
        /*child: Center(
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
                      fontWeight: FontWeight.w700,
                      fontSize: 34.sp
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
              *//*Container(
                width: 320.w,
                height: 320.w,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        ImageUrls.playlistCover02,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: 10,
                  viewportFraction: 0.8, // 전체 슬라이드 아이템 크기
                  scale: 0.85,
                  loop: false,
                ),
              ),*//*
            ],
          ),
        )*/


        /*child: Column(
          children: [
            SizedBox(height: 30.h,),
            CustomSearchBar(),
            SizedBox(height: 30.h,),
            Builder(
              builder: (context){
                return Center(
                  child: SizedBox(
                    height: 200,
                    child: PageView.builder(
                        controller: _pageViewController,
                        itemCount: 10,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          var _scale = _currentIndex == index ? 1.0 : 0.8;
                          *//*return Container(
                            width: 200,
                            height: 300,
                            color: Colors.deepOrangeAccent,
                          );*//*
                          return TweenAnimationBuilder(
                            tween: Tween(begin: _scale, end: _scale),
                            duration: const Duration(milliseconds: 350),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  ShadowPalette.defaultShadowLight
                                ]
                              ),
                            ),
                            builder: (context, double value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            });
                        }),
                  ),
                );
              }
            ),
            SizedBox(height: 20.h,),
          ],
        ),*/
      ),
    );
  }
}
