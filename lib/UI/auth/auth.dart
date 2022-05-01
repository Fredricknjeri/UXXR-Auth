import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/colors.dart';
import 'confirmation.dart';

class ChooseAuth extends StatefulWidget {
  const ChooseAuth({Key? key}) : super(key: key);

  @override
  State<ChooseAuth> createState() => _ChooseAuthState();
}

class _ChooseAuthState extends State<ChooseAuth> {
  
  Future registerUser()async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  // _auth.verifyPhoneNumber(phoneNumber: "", 
  // verificationCompleted: verificationCompleted, 
  // verificationFailed: verificationFailed, 
  // codeSent: null, 
  // codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
  // );

  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          centerTitle: true,
          title: Text('Connect your wallet',
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
                left: 40.w,
              ),
              child: Text("We’ll send you a confirmation code",
                  style: GoogleFonts.poppins(
                      color: ligtTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400)),
            ),
            const Spacer(),
            Container(
              height: 69.h,
              decoration: BoxDecoration(
                //  border:
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: TextField(
                // controller: _numberController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor)),
                  // contentPadding: const EdgeInsets.all(16),
                  labelText: "Phone number or Email",
                  labelStyle: TextStyle(),
                  // border: InputBorder.none,
                  isCollapsed: false,
                  isDense: true,
                  prefixIcon: CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      favorite: const ['+39', 'FR'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                      hideMainText: true),
                  // prefixStyle: TextStyle(color: Colors.transparent),

                  // prefixStyle: TextStyle(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmCode()));
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                      child: Text('Continue',
                          style: GoogleFonts.poppins(
                              color: ligtTextColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500)))),
            ),
            SizedBox(
              height: 21.h,
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: 5.w,
            //   ),
            //   child: Row(
            //     children: [

            Row(
              children: [
                Text("By signing up I agree to Zëdfi’s ",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
                Text("Privacy Policy ",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
                Text("and ",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ],
            ),

            Row(
              children: [
                Text("Terms of Use ",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
                Text("and allow Zedfi to use your  information ",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
              ],
            ),

            Row(
              children: [
                Text("for future",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400)),
                Text(" Marketing purposes.",
                    style: GoogleFonts.poppins(
                        color: ligtTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
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
