import 'package:app/modules/home/controllers/home.controller.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomScrollableHeader(onChanged: controller.onSearch),
            floating: true,
          ),
          controller.obx(
            (state) {
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CompanyCard(company: state![index]),
                    childCount: state?.length ?? 0,
                  ),
                ),
              );
            },
            onLoading: SliverFillRemaining(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CompanyCardScaffold(),
                  ),
                ],
              ),
            ),
            onEmpty: SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: CustomErrorWidget(
                message: 'Nenhum resultado encontrado',
                asset: 'search',
              ),
            ),
            onError: (message) => SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: CustomErrorWidget(
                message: 'Erro ao tentar se comunicar com o servidor',
                asset: 'error',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
