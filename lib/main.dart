import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app/app.dart';

main() async {
  await GetStorage.init();
  runApp(App());
}
