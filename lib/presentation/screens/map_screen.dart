import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:google_maps/constants/strings.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: BlocProvider<PhoneAuthCubit>(
            create: (context) => phoneAuthCubit,
            child: ElevatedButton(
              onPressed: () async {
                await phoneAuthCubit.logOut();
                Navigator.of(context).pushReplacementNamed(loginScreen);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(110, 50),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
