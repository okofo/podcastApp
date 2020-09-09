import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;


class AudioProvider extends ChangeNotifier {
final _url = 'https://itsallwidgets.com/podcast/feed';

  RssFeed _feed;
  RssItem _selectedItem;

  RssFeed get feed => _feed;
  void getFeed() async {
    final res = await http.get(_url);
    final xmlStr = res.body;
    _feed = RssFeed.parse(xmlStr);
    notifyListeners();
  }

  RssItem get selectedItem => _selectedItem;
  set selectedItem(RssItem value) {
    _selectedItem = value;
    notifyListeners();
  }
}
//http://feeds.bbci.co.uk/news/rss.xml
//https://anchor.fm/s/342f9db8/podcast/rss
//https://itsallwidgets.com/podcast/feed
