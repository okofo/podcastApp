import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thePod/screens/audioPage.dart';
import 'theme.dart';

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: PodcastHome(),
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      title: '',
    );
  }
}
