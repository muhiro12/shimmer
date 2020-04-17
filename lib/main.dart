import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/home.dart';
import 'package:shimmer/settings.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.box);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(HiveKeys.box).listenable(),
      builder: (context, box, widget) {
        var darkMode = box.get(HiveKeys.darkMode, defaultValue: false);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    final box = Hive.box(HiveKeys.box);
    final darkMode = box.get(HiveKeys.darkMode, defaultValue: false);
    box.put('darkMode', !darkMode);
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
      ),
      body: [
        Home(),
        Settings(),
      ].elementAt(_selectedIndex),
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
