import 'package:flutter/material.dart';
import 'package:google_maps/constants/my_colors.dart';
import 'package:google_maps/constants/strings.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  late String phoneNumber;
final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is your phone number?',
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: const Text(
            'Please enter your phone number to verify your account.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.lightGrey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: Text(
              '${generateCountryFlag()} +20',
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.blue,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                } else if (value.length > 11) {
                  return 'Too short for a phone number';
                }
                return null;
              },
              onSaved: (value) {
                phoneNumber = value!;
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, otpScreen);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: const Text(
          'Next',
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
        body: SingleChildScrollView(
          child: Form(
            key: _phoneFormKey,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 88.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroTexts(),
                  const SizedBox(
                    height: 110.0,
                  ),
                  _buildPhoneFormField(),
                  const SizedBox(height: 70.0,),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
