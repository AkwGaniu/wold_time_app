import 'package:flutter/material.dart';
import 'package:softnexus/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void createInstance() async{
    WorldTime instance = WorldTime(location: 'Lagos', url: 'africa/lagos', flag: 'nigeria.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
    createInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 200.0,
        ),
      ),
    );
  }
}
