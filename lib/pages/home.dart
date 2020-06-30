import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //Some Logic here
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDay'] ? Colors.blue[700] : Colors.indigo[600];
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 140.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  dynamic response = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = response;
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                    child: Image(
                      width: 50.0,
                      height: 40.0,
                      image: AssetImage('assets/${data['flag']}'),
                    ),
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 55.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
