import 'package:flutter/material.dart';


class CountDownTimer extends AnimatedWidget {
  CountDownTimer({this.tempoRestanteEmSegundos})
      : super(listenable: tempoRestanteEmSegundos);

  Animation<int> tempoRestanteEmSegundos;

  Widget build(BuildContext context) {
    String hours = '${(tempoRestanteEmSegundos.value).floor()}';
    String minutes = '${(tempoRestanteEmSegundos.value).floor()}';
    String seconds = '${(tempoRestanteEmSegundos.value % 60)}'.padLeft(2, '0');
    return new Text(
      '$hours:$minutes:$seconds',
      style: Theme.of(context).textTheme.display2,
    );
  }
}



void main() {
  runApp(new Container(
    color: Colors.white,
  ));
  runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.red),
    home: new HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int hours = 1;
  int minutes = 25;
  int seconds = 0;
  var horasAdd;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    horasAdd = ((hours * 60 * 60) + (minutes * 60) + (seconds));

    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: seconds, minutes: minutes * 60, hours: hours*60*60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Mais Água'),
        centerTitle: true,
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.play_arrow),
        onPressed: () {
          _controller.forward(from: 0.0);
        },
      ),
      body: new Center(
        child: new CountDownTimer(
          tempoRestanteEmSegundos: new IntTween(
            begin: _controller.duration.inSeconds,
            end: 0,
          ).animate(_controller),
        ),
      ),
    );
  }
}
