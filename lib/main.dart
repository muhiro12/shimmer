import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/hive/keys.dart';
import 'package:shimmer/home.dart';
import 'package:shimmer/settings.dart';

void main() async {
  await Hive.initFlutter();
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
        final darkMode = box.get(HiveKeys.darkMode, defaultValue: false);
        final colorValue =
            box.get(HiveKeys.primaryColor, defaultValue: Colors.blue.value);
        final primaryColor =
            Colors.primaries.firstWhere((color) => color.value == colorValue);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: primaryColor,
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
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Text'),
        children: <Widget>[
          FlatButton(
            child: Text('Button'),
            onPressed: () {
              final box = Hive.box(HiveKeys.dataBox);
              List<String> card =
                  box.get(HiveKeys.card, defaultValue: List<String>());
              card.insert(0, DateTime.now().toString());
              box.put(HiveKeys.card, card);
            },
          ),
        ],
      ),
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
