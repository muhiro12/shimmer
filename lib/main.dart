import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/configuration/app_theme.dart';
import 'package:shimmer/model/interface/configuration_data_store.dart';
import 'package:shimmer/model/interface/data_store.dart';
import 'package:shimmer/widget/category/category_scaffold.dart';
import 'package:shimmer/widget/common/bottom_navigator.dart';
import 'package:shimmer/widget/common/shimmer_card_creator_launcher.dart';
import 'package:shimmer/widget/home/home_scaffold.dart';

void main() async {
  await DataStore.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConfigurationDataStore.listenableConfiguration,
      builder: (context, box, widget) {
        final handwriting = ConfigurationDataStore.fetchHandWriting();
        final darkMode = ConfigurationDataStore.fetchDarkMode();
        final primaryColor = ConfigurationDataStore.fetchPrimaryColor();
        return MaterialApp(
          title: 'Shimmer',
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

  final List<BottomNavigator> _bottomNavigators = [
    BottomNavigator(
      HomeScaffold(),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
    ),
    BottomNavigator(
      CategoryScaffold(),
      BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('Category'),
      ),
    ),
  ];

  @override
  void dispose() async {
    await DataStore.deInit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _bottomNavigators,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonTapped,
        tooltip: 'New',
        child: Icon(Icons.create),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigators
            .map((bottomNavigator) => bottomNavigator.barItem)
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onBarItemTapped,
      ),
    );
  }

  void _onFloatingActionButtonTapped() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: ShimmerCardCreatorLauncher(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppParameter.radius),
        ),
      ),
    );
  }

  void _onBarItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _bottomNavigators[index].key.currentState.popToRoot();
      } else {
        _selectedIndex = index;
      }
    });
  }
}
