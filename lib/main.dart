import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation Test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 500.0;
  double padValue2 =500.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
      padValue2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPadding(
            padding: EdgeInsets.only(left:150,top: padValue2),
            duration: const Duration(seconds: 2),
            curve: Curves.linear,
            child: const Icon(
              Icons.airplanemode_active,
              color: Colors.blue,
              size: 50,
            ),
            onEnd: (){
              setState(() {
                padValue2 = 500;
              });
            }
        ),

        Padding(
          padding: const EdgeInsets.only(left:150,top: 10),

          child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.blue),
            foregroundColor: MaterialStateProperty.all(
                Colors.yellow),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.airplanemode_active),
              Text('起飛'),
            ],
          ),
            onPressed: () {
              _updatePadding(padValue2== 0.0 ? 100.0 : 0.0);
            }
        ),
      ),
      ],
    );
  }
}
