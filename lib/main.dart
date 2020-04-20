import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/configuration/size.dart';
import 'package:shimmer/configuration/theme.dart';
import 'package:shimmer/hive/configuration_box.dart';
import 'package:shimmer/hive/data_box.dart';
import 'package:shimmer/hive/shimmer_category.dart';
import 'package:shimmer/hive/shimmer_data.dart';
import 'package:shimmer/hive/shimmer_data_list.dart';
import 'package:shimmer/widget/category/root.dart';
import 'package:shimmer/widget/common/bottom_navigator.dart';
import 'package:shimmer/widget/home/root.dart';
import 'package:shimmer/widget/shimmer_card/creator_launcher.dart';

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
