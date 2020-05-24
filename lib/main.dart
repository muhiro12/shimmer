import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_theme.dart';
import 'package:shimmer/interface/database/database.dart';
import 'package:shimmer/model/configurations_repository.dart';
import 'package:shimmer/scaffold/album_scaffold.dart';
import 'package:shimmer/scaffold/home_scaffold.dart';
import 'package:shimmer/widget/bottom_navigator.dart';

void main() async {
  await Database.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConfigurationsRepository.instance.listenable(),
      builder: (context, box, widget) {
        final configurations = ConfigurationsRepository.instance.load();
        final primaryColor =
            ConfigurationsRepository.instance.fetchPrimaryColor();
        final isHandWriting =
            ConfigurationsRepository.instance.fetchIsHandWriting();
        final themeData = configurations.isSystemTheme
            ? ThemeMode.system
            : (configurations.isDarkMode ? ThemeMode.dark : ThemeMode.light);
        return MaterialApp(
          title: 'Shimmer',
          theme: AppTheme(primaryColor, isHandWriting).light(),
          darkTheme: AppTheme(primaryColor, isHandWriting).dark(),
          themeMode: themeData,
          home: MyHomePage(title: 'Shimmer'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  static BuildContext context;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<BottomNavigator> _bottomNavigators = [
    BottomNavigator(
      HomeScaffold(),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
    ),
    BottomNavigator(
      AlbumScaffold(),
      BottomNavigationBarItem(
        icon: Icon(Icons.filter),
        title: Text('Album'),
      ),
    ),
  ];

  @override
  void dispose() async {
    await Database.deInit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyHomePage.context = context;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _bottomNavigators,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigators
            .map((bottomNavigator) => bottomNavigator.barItem)
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _bottomNavigators[index].key.currentState.popToRoot();
      } else {
        _selectedIndex = index;
      }
    });
  }
}
