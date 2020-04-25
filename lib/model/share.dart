import 'dart:io';

import 'package:share_extend/share_extend.dart';

class Share {
  static void image(File file) {
    ShareExtend.share(file.path, "image");
  }
}
