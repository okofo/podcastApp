import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thePod/provider/audioProvider.dart';
import 'package:thePod/screens/PlayerPage.dart';
import 'package:webfeed/webfeed.dart';

class PodcastList extends StatelessWidget {
  final RssFeed rssFeed;

  const PodcastList({Key key, this.rssFeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, podcast, _) {
        return podcast.feed != null
            ? AudioItem(rssFeed: podcast.feed)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class AudioItem extends StatefulWidget {
  const AudioItem({Key key, this.rssFeed}) : super(key: key);
  final RssFeed rssFeed;

  @override
  _AudioItemState createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  @override
  Widget build(BuildContext context) {
    bool liked = false;

    Widget iconButton({Widget icon, Color color, VoidCallback onPressed}) {
      return IconButton(
        color: color,
        icon: IconButton(
          icon: icon,
          color: color,
          onPressed: onPressed,
        ),
        onPressed: onPressed,
      );
    }

    final p = Provider.of<AudioProvider>(context, listen: false);

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: p.feed.items
          .map(
            (i) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(p.feed.image.url),
                ),
                title: Text(i.title),
                subtitle: Text(
                  i.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: iconButton(
                  icon: liked
                      ? Icon(
                          CupertinoIcons.heart_solid,
                        )
                      : Icon(
                          CupertinoIcons.heart_solid,
                        ),
                  color: liked ? Colors.red : Colors.grey,
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                ),
                onTap: () {
                  Provider.of<AudioProvider>(context, listen: false)
                      .selectedItem = i;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlayerPage(),
                    ),
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
