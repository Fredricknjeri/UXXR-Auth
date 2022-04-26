import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/colors.dart';
import '../../components/fade_transition.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({Key? key}) : super(key: key);

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final FocusNode _field1 = FocusNode();
  final FocusNode _field2 = FocusNode();
  final FocusNode _field3 = FocusNode();
  final FocusNode _field4 = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _field1.dispose();
    _field2.dispose();
    _field3.dispose();
    _field4.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focus}) {
    if (value!.length == 1) {
      focus!.requestFocus();
    }
  }

  Widget field({FocusNode? focus, FocusNode? next, bool autofocus = false}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: const Offset(0, 2),
            spreadRadius: 1)
      ], color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      width: 64,
      child: TextFormField(
          autofocus: autofocus,
          focusNode: focus,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500, color: Colors.black),
          onChanged: (e) {
            next != null ? nextField(value: e, focus: next) : null;
          },
          decoration: const InputDecoration(
              fillColor: Colors.green,
              border: OutlineInputBorder(borderSide: BorderSide.none))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.arrow_back, color: Colors.black),
          // ),
          // centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('We’ve sent you a code',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.w,
              ),
              child: Text("Enter the confirmation code below ",
                  style: GoogleFonts.poppins(
                      color: ligtTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 150.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeAnimation(
                    delay: 200,
                    child:
                        field(focus: _field1, next: _field2, autofocus: true)),
                FadeAnimation(
                    delay: 400, child: field(focus: _field2, next: _field3)),
                FadeAnimation(
                    delay: 600, child: field(focus: _field3, next: _field4)),
                FadeAnimation(delay: 800, child: field(focus: _field4)),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            Row(
              children: [
                Text("Didn’t recieve a code?",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
                Text("\tWait for 57 sec.",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
          ],
        ),
      ),
    );
  }
}
