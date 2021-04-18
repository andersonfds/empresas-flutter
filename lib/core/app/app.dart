import 'package:app/core/bindings/app.bindings.dart';
import 'package:app/core/routes/routes.dart';
import 'package:app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: getTheme(),
      getPages: getRoutes(),
      initialRoute: 'auth',
      initialBinding: AppBindings(),
    );
  }
}
