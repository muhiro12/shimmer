import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/configuration/app_parameter.dart';
import 'package:shimmer/main.dart';
import 'package:shimmer/model/configurations_repository.dart';

class SettingsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ConfigurationsRepository.instance.fetchIsDarkMode();
    final isHandWriting =
        ConfigurationsRepository.instance.fetchIsHandWriting();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          CloseButton(),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('DarkMode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: _saveIsDarkMode,
              ),
            ),
            ListTile(
              title: Text('HandWriting'),
              trailing: Switch(
                value: isHandWriting,
                onChanged: _saveIsHandWriting,
              ),
            ),
            ExpansionTile(
              title: Text('PrimaryColor'),
              children: <Widget>[
                Container(
                  height: AppParameter.componentL,
                  margin: EdgeInsets.only(
                    left: AppParameter.spaceS,
                    right: AppParameter.spaceS,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.horizontal,
                    children: Colors.primaries
                        .map(
                          (color) => GestureDetector(
                            child: Card(
                              color: color,
                              child: Visibility(
                                visible:
                                    color == Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () => _savePrimaryColor(color),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveIsDarkMode(bool value) {
    ConfigurationsRepository.instance.saveIsDarkMode(value);
  }

  void _saveIsHandWriting(bool value) {
    ConfigurationsRepository.instance.saveIsHandWriting(value);
  }

  void _savePrimaryColor(MaterialColor color) {
    ConfigurationsRepository.instance.savePrimaryColor(color);
  }

  static void showAsModal() {
    showCupertinoModalPopup(
      context: MyHomePage.context,
      builder: (context) => SettingsScaffold(),
    );
  }
}
