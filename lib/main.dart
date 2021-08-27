import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


void main(){
  runApp(
      MaterialApp(
          title:"Weather ",
          debugShowCheckedModeBanner: false,
          home:Weather()


      )
  );
}


class Weather  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeatherState();
    throw UnimplementedError();
  }


}
class WeatherState extends State<Weather>{
  var temp;
  var desc;
  var currently;
  var wind;
  var humidity;
  Future getWeather() async{
    http.Response response= await http.get('https://api.openweathermap.org/data/2.5/weather?q=hyderabad&appid=956dfeb45326ef21940cd236b5e7bb67');
    var results=jsonDecode(response.body);
    setState(() {
      this.temp=results["main"]["temp"];
      this.desc=results["weather"][0]["description"];
      this.wind=results["wind"]["speed"];
      this.humidity=results["main"]["humidity"];
      this.currently=results["weather"][0]["main"];
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    getWeather();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('WEATHER'),



        ),
        body: Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,

            // color: Colors.red,
            child: Column(

                children: [
                Text('Currently in boston',
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600


                )),
            Text('${this.temp}\u00B0',
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600


                )),
            Text('${this.currently}',
              style: TextStyle(
                  color:Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600


              ),






            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Card(
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title:Text("Temperature"),
                    trailing: Text('${this.temp}+\u00B0'),

                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title:Text("Weather"),
                  trailing: Text('${this.desc}\u00B0'),

                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title:Text("Humidity"),
                  trailing: Text('${this.humidity}\u00B0'),

                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title:Text("Wind Speed "),
                  trailing: Text('${this.wind}\u00B0'),

                ),



              ],


            )

]

        )));
    throw UnimplementedError();
  }

}