import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myworldtime/main.dart';

class ErrorPage extends StatefulWidget {

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/error.gif',),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding()));
                },
                label: const Text('Retry'),
                icon: const Icon(CupertinoIcons.refresh_thick),
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Colors.black),
                    foregroundColor:
                    MaterialStatePropertyAll<Color>(Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
