
import 'package:http_requests/http_requests.dart';
class FetchModel {

  late bool _isday;
  late String _myTime;

  Future<String> getTime(String area) async{
      Response res = await HttpRequests.get('https://api.api-ninjas.com/v1/worldtime?city=$area', headers:{'X-Api-Key': '8GjZ2seU/INH+feZRJaC+g==WIzur5oO5evjKYBT'});
      Map result = res.json;
      var currenttime = result['datetime'].toString();
      String timer = currenttime.split(' ')[1];
      List HMS = timer.split(':');
      String currentHour = HMS[0];
      print(HMS);
      if(int.parse(currentHour) > 12){
        int topm = int.parse(currentHour) - 12;
        _myTime = "$topm:${HMS[0]}:${HMS[1]}";
        return "$topm:${HMS[1]}:${HMS[2]} PM";
      }
      else{
        _myTime = "$timer AM";
        return  "$timer AM";
      }


  }

  bool isDay(){
    var currentHour = _myTime.split(':')[0];
    if(int.parse(currentHour)>= 12){
      print(currentHour);
      return false;
    }
    else{
      print(currentHour);
      return true;
    }

  }
}