import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thePod/provider/audioProvider.dart';
import 'package:thePod/util/playBackButton.dart';
import 'package:webfeed/webfeed.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({this.item});
  final RssItem item;

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<AudioProvider>(context, listen: false).selectedItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220.0,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          Provider.of<AudioProvider>(context, listen: false)
                              .feed
                              .image
                              .url),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                SingleChildScrollView(child: Text(p.description)),
                AudioControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
