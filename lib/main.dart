import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/configuration/app_size.dart';
import 'package:shimmer/configuration/app_theme.dart';
import 'package:shimmer/model/data_store.dart';
import 'package:shimmer/scaffold/category_root.dart';
import 'package:shimmer/scaffold/home_root.dart';
import 'package:shimmer/widget/bottom_navigator.dart';
import 'package:shimmer/widget/shimmer_card_creator_launcher.dart';

void main() async {
  await DataStore.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DataStore.listenableConfiguration,
      builder: (context, box, widget) {
        final handwriting = DataStore.fetchHandWriting();
        final darkMode = DataStore.fetchDarkMode();
        final primaryColor = DataStore.fetchPrimaryColor();
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
      HomeRoot(),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
    ),
    BottomNavigator(
      CategoryRoot(),
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
        tooltip: 'Create',
        child: Icon(Icons.add),
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
        borderRadius: BorderRadius.circular(AppSize.radius),
      ),
    );
  }

  void _onBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
