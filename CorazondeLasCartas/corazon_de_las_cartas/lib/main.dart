import 'dart:ui';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  FirstPage createState() => FirstPage();
}

class FirstPage extends State<MyApp> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text('Which card is in you heart?'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardPage()),
                  );
                },
                icon: Image.asset('images/puzzle.png'),
                iconSize: 200,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await player.setAsset('sound/yugisound.mp3');
          // Add your onPressed code here!
          player.play();
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class CardPage extends StatelessWidget {
  String image = 'images/' + randomNumber().toString() + '.jpeg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text('This is you in you heart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(image)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back Choose a new heart'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to generate Random Number
int randomNumber() {
  var random = new Random();

  int min = 1;

  int max = 7;

  int result = min + random.nextInt(max - min);

  return result;
}
