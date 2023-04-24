import 'package:flutter/material.dart';
import 'package:http_requests/http_requests.dart';
import 'package:myworldtime/dashboard.dart';
import 'package:myworldtime/errorpage.dart';
import 'package:myworldtime/fetchmodel.dart';

const personalFont = TextStyle(fontFamily: 'Montserrat');
String currentTime = '';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
    primaryColor: Colors.black,
        textTheme: TextTheme(
      displaySmall: personalFont,
      displayLarge: personalFont,
      displayMedium: personalFont,
      bodySmall: personalFont,
      bodyMedium: personalFont,
      bodyLarge: personalFont,
      labelLarge: personalFont,
      labelMedium: personalFont,
      labelSmall: personalFont,
    )),
    debugShowCheckedModeBanner: false,
    home: Onboarding(),
  ));
}

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  checkifset() async {
    try{
      var fm = FetchModel();
      String Country = 'London';
       var ftime = await fm.getTime('London');
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(fetchedTime: ftime.toString(), day: fm.isDay(), country:Country,)));
    }
    on HttpRequestException {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ErrorPage()));
    }
    catch(err){
      print("Error Message: $err");
    }

  }
  @override
  void initState() {
    checkifset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/earthspin.gif',
                width: 220,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'WORLD TIME',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              Text(
                'Shows current local time and date in cities and countries in all time zones',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 9,
                    color: Colors.grey),
              ),
              Text(
                currentTime,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
