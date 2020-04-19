import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/configuration/theme.dart';
import 'package:shimmer/hive/genre.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/home/main.dart';
import 'package:shimmer/settings/main.dart';
import 'package:shimmer/shimmer/genre_selector.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShimmerDataAdapter());
  Hive.registerAdapter(GenreAdapter());
  await Hive.openBox(HiveKeys.configurationBox);
  await Hive.openBox(HiveKeys.dataBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveKeys.configurationBox).listenable(),
      builder: (context, box, widget) {
        final handwriting = box.get(HiveKeys.handwriting, defaultValue: false);
        final darkMode = box.get(HiveKeys.darkMode, defaultValue: false);
        final colorValue =
            box.get(HiveKeys.primaryColor, defaultValue: Colors.blue.value);
        final primaryColor =
            Colors.primaries.firstWhere((color) => color.value == colorValue);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme(primaryColor, handwriting).light(),
          darkTheme: AppTheme(primaryColor, handwriting).dark(),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: MyHomePage(title: 'Shimmer'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onFloatingActionButtonTapped() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ShimmerCardGenreSelector(),
    );
  }

  void _onBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: [
          Home(),
          Settings(),
        ].elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonTapped,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBarItemTapped,
      ),
    );
  }
}
