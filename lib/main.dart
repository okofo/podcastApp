import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/audioProvider.dart';
import 'util/materialTheme.dart';
import 'util/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioProvider(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(
            ThemeData.light(),
          ),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}
