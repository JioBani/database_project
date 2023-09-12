import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w800
              ),
            )
          ),
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {

                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
