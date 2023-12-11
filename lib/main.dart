import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override


  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initstate() {
    assetsAudioPlayer.open(Playlist(audios: [Audio("sounds/sample-6s.mp3")]),
        autoStart: false);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Audio Player'),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text("SAMPLE1"),
                trailing: IconButton(
                  onPressed: () {
                    bool isPlaying = false;
                    final assetsAudioPlayer = AssetsAudioPlayer();
                    if (assetsAudioPlayer.isPlaying.value) {
                      assetsAudioPlayer.pause();
                    } else {
                      assetsAudioPlayer.play();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                ),
              )
            ],
          )),
    );
  }
}
