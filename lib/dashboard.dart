import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myworldtime/location.dart';

class Dashboard extends StatefulWidget {
  Dashboard({required this.fetchedTime, required this.day, required this.country});
  String fetchedTime;
  bool day;
  String country;
  late String Meridian = this.fetchedTime[this.fetchedTime.length-2] + this.fetchedTime[this.fetchedTime.length-1];
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.Meridian == "AM"?  AssetImage('lib/assets/images/day.jpg') : AssetImage('lib/assets/images/night.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Location()));
                },
                label: const Text('Edit Location'),
                icon: const Icon(CupertinoIcons.location_solid),
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black),
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white)),
              ),
              SizedBox(height: 50,),
              Text(
                widget.fetchedTime.toString(),
                style: TextStyle(fontSize: 40, color: widget.Meridian == "AM"?  null :Colors.white),
              ),
              SizedBox(height: 50,),
              Text(
                widget.country,
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w900, color: widget.Meridian == "AM"?  null :Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
