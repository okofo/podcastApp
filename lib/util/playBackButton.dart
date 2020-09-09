import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:provider/provider.dart';
import 'package:thePod/provider/audioProvider.dart';

class AudioControls extends StatefulWidget {
  @override
  _AudioControlsState createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  bool _isPlaying = false;

  FlutterSound _sound;
  
  double _playPosition;
  Stream<PlayStatus> _playerSubscribtion;

  @override
  void initState() {
    super.initState();
    _sound = FlutterSound();
    _playPosition = 0;
  }

  void _stop() async {
    await _sound.stopPlayer();
    setState(() => _isPlaying = false);
  }

  void _play(String url) async {
    await _sound.startPlayer(url);
   _playerSubscribtion = _sound.onPlayerStateChanged
      ..listen((event) {
        if (event != null) {
          setState(
              () => _playPosition = event.currentPosition / event.duration);
        }
      });
    setState(() => _isPlaying = true);
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<AudioProvider>(context, listen: false).selectedItem;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.fast_rewind),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 16,
              icon: _isPlaying
                  ? Icon(
                      CupertinoIcons.pause_solid,
                      color: Colors.black,
                    )
                  : Icon(
                      CupertinoIcons.play_arrow_solid,
                      color: Colors.black,
                    ),
              onPressed: () {
                if (_isPlaying) {
                  _stop();
                } else {
                  _play(p.guid);
                }
              },
            ),
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.fast_forward),
              onPressed: () {},
            ),
          ],
        ),
        Slider(
          value: _playPosition,
          onChanged: (double value) {},
        ),
      ],
    );
  }
}

//https://incompetech.com/music/royalty-free/mp3-royaltyfree/Surf%20Shimmy.mp3
