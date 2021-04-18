import 'package:app/core/constants/api.dart';
import 'package:app/core/dto/company-response.dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyCard extends StatelessWidget {
  final CompanyResponseDto company;

  const CompanyCard({
    Key? key,
    required this.company,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Get.toNamed(
            'company/${company.id}',
            arguments: company,
          );
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey[100],
                child: Image.network(
                  Uri.parse(apiUrl).replace(path: company.photo).toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      company.enterpriseName ?? 'Unknown',
                      style: Get.textTheme.headline6,
                    ),
                  ),
                  Text(
                    company.description ?? 'Unknown',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
