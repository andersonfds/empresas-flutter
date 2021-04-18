import 'package:app/core/constants/api.dart';
import 'package:app/modules/company/controllers/company.controller.dart';
import 'package:app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CompanyPage extends GetView<CompanyController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomFixedAppBar(
          title: controller.company.value?.enterpriseName ?? 'Empresa',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey[100],
                  child: Image.network(
                    Uri.parse(apiUrl)
                        .replace(path: controller.company.value?.photo)
                        .toString(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    color: Colors.blue[800],
                    icon: Icon(Fontisto.facebook),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.lightBlueAccent,
                    icon: Icon(Fontisto.twitter),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.blueAccent,
                    icon: Icon(Fontisto.linkedin),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  controller.company.value?.description ?? 'No data',
                  style: Get.textTheme.bodyText2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
