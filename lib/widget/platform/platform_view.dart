import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class PlatformView extends StatelessWidget {
  final bool isCupertino = Platform.isIOS || Platform.isMacOS;
}
