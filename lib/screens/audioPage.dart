import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:thePod/provider/audioProvider.dart';
import 'package:thePod/util/audioItem.dart';
import 'package:thePod/util/myBottomNavBar.dart';
import 'package:thePod/util/subscribebutton.dart';

class PodcastHome extends StatefulWidget {
  @override
  _PodcastHomeState createState() => _PodcastHomeState();
}

class _PodcastHomeState extends State<PodcastHome> {
  //int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomNavBar(),
      body: MainContent(),
    );
  }
}

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  AudioProvider get p {
    return Provider.of<AudioProvider>(context);
  }


 @override
  void initState() {
    super.initState();
    context.read<AudioProvider>().getFeed();
  }

  @override
  Widget build(BuildContext context) {
    if (p.feed == null)
      return Center(
        child: CircularProgressIndicator(),
      );
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Stack(
          alignment: Alignment.centerLeft,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 250,
              width: 500,
              decoration: BoxDecoration(
                color: Color(0XFF213340),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    p.feed.title,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    p.feed.description,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 160,
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      width: 110,
                      decoration: BoxDecoration(
                        //color: Colors.yellow,
                        image: DecorationImage(
                          image: NetworkImage(p.feed.image.url),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(width: 17),
                    Subscribe(),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 90),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            '${p.feed.items.length}. Episodes',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        PodcastList(),
      ],
    );
  }
}
