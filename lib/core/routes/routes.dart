import 'package:app/modules/auth/auth.dart';
import 'package:app/modules/company/bindings/company.bindings.dart';
import 'package:app/modules/company/pages/company.page.dart';
import 'package:app/modules/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

List<GetPage> getRoutes() => [
      GetPage(
        name: 'auth',
        page: () => AuthPage(),
        binding: AuthBindings(),
        transition: Transition.fadeIn,
        curve: Curves.easeIn,
      ),
      GetPage(
        name: 'home',
        page: () => HomePage(),
        binding: HomeBindings(),
        transition: Transition.fadeIn,
        curve: Curves.easeIn,
      ),
      GetPage(
        name: 'company/:id',
        page: () => CompanyPage(),
        binding: CompanyBindings(),
        transition: Transition.cupertino,
        curve: Curves.easeIn,
      ),
    ];
