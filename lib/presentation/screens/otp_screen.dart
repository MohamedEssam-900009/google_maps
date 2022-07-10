import 'package:flutter/material.dart';
import 'package:google_maps/constants/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  OtpScreen({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final phoneNumber = '';
  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Virefy your phone number?',
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
                text: 'Enter your 6 digits code numbers send to you at',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                      text: '$phoneNumber',
                      style: const TextStyle(color: MyColors.blue))
                ]),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1.0,
            activeColor: MyColors.blue,
            inactiveColor: MyColors.blue,
            inactiveFillColor: Colors.white,
            activeFillColor: MyColors.lightBlue,
            selectedColor: MyColors.blue,
            selectedFillColor: Colors.white),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          //otpCode = code;
          debugPrint("Completed");
        },
        onChanged: (value) {
         // debugPrint(value);
        },
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 88.0,
          ),
          child: Column(
            children: [
              _buildIntroTexts(),
              const SizedBox(
                height: 88.0,
              ),
              _buildPhoneCodeFields(context),
              const SizedBox(
                height: 60.0,
              ),
              _buildVerifyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
