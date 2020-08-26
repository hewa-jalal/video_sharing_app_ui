import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // color: Color(0xff313638),

    return Container(
      width: double.infinity,
      color: Color(0xff1C1F21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tap the icon to upload a video',
            style: GoogleFonts.alata(
              fontSize: 74.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 140.0.h),
          SizedBox(
            height: 300,
            child: Lottie.asset(
              'assets/images/upload_anim.json',
            ),
          ),
        ],
      ),
    );
  }
}
