import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("추천 장르"),
        Row(

        ),
        Row(
          
        )
      ],
    );
  }
}

class GenrePanelWidget extends StatelessWidget {
  const GenrePanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r)
      ),
    );
  }
}

