import 'package:bloks_youtube_clone/src/pages/pages.dart';
import 'package:flutter/material.dart';

import '../pages/pages.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };
}
