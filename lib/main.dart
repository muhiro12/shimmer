import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/category/main.dart';
import 'package:shimmer/configuration/theme.dart';
import 'package:shimmer/hive/configuration_box.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
import 'package:shimmer/home/main.dart';
import 'package:shimmer/settings/main.dart';
import 'package:shimmer/shimmer/category_selector.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ShimmerCategoryAdapter());
  Hive.registerAdapter(ShimmerDataAdapter());
  Hive.registerAdapter(ShimmerDataListAdapter());
  await Hive.openBox(ConfigurationBox.key.toString());
  await Hive.openBox(DataBox.key.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(ConfigurationBox.key.toString()).listenable(),
      builder: (context, box, widget) {
        final handwriting = box.get(
          ConfigurationBox.handWriting.toString(),
          defaultValue: false,
        );
        final darkMode = box.get(
          ConfigurationBox.darkMode.toString(),
          defaultValue: false,
        );
        final colorValue = box.get(
          ConfigurationBox.primaryColorValue.toString(),
          defaultValue: Colors.blue.value,
        );
        final primaryColor = Colors.primaries.firstWhere(
          (color) => color.value == colorValue,
        );
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
      builder: (context) => ShimmerCardCategorySelector(),
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
        actions: <Widget>[
          Visibility(
            visible: _selectedIndex == 0,
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => Settings(),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeNavigator(),
            CategoryNavigator(),
          ],
        ),
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
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBarItemTapped,
      ),
    );
  }
}
