import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/model/interface/configuration_data_store.dart';

class SettingsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final handWriting = ConfigurationDataStore.fetchHandWriting();
    final darkMode = ConfigurationDataStore.fetchDarkMode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          CloseButton(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Handwriting'),
                Switch(
                  value: handWriting,
                  onChanged: _onHandWritingChanged,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('DardMode'),
                Switch(
                  value: darkMode,
                  onChanged: _onDarkModeChanged,
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: Colors.primaries
                    .map(
                      (color) => GestureDetector(
                        child: Card(
                          color: color,
                          child: Visibility(
                            visible: color == Theme.of(context).primaryColor,
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () => _onColorCardTap(color),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onHandWritingChanged(bool value) {
    ConfigurationDataStore.saveHandWriting(value);
  }

  void _onDarkModeChanged(bool value) {
    ConfigurationDataStore.saveDarkMode(value);
  }

  void _onColorCardTap(MaterialColor color) {
    ConfigurationDataStore.savePrimaryColor(color);
  }
}
