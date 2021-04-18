import 'package:app/modules/auth/controllers/auth.controller.dart';
import 'package:app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<AuthController> {
  Widget _buildHeader() => KeyboardVisibilityBuilder(
        builder: (context, isVisible) => CustomAppBar(
          expanded: !isVisible,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo.png'),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isVisible ? 0.0 : 1.0,
                  child: Text(
                    'Seja bem vindo ao empresas!',
                    style: Get.textTheme.headline6?.apply(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildHeader(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Email', style: Get.textTheme.caption),
                    ),
                    TextFormField(
                      controller: controller.emailCtrl,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: controller.validateEmail,
                      onChanged: controller.setEmail,
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Senha', style: Get.textTheme.caption),
                    ),
                    Obx(() => TextFormField(
                          obscureText: controller.passwordVisible.value,
                          controller: controller.passwordCtrl,
                          textInputAction: TextInputAction.done,
                          onEditingComplete:
                              controller.authRequest.value.isValid &&
                                      !controller.isLoading.value
                                  ? controller.onLogin
                                  : null,
                          onChanged: controller.setPassword,
                          validator: controller.validatePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(controller.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: controller.switchPasswordVisibility,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Obx(() => Visibility(
                            visible: controller.error.value?.isNotEmpty == true,
                            child: Text(
                              controller.error.value ?? '',
                              style: Get.textTheme.caption?.apply(
                                color: Colors.red,
                              ),
                            ),
                          )),
                    ),
                    Obx(
                      () => Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.authRequest.value.isValid &&
                                  !controller.isLoading.value
                              ? controller.onLogin
                              : null,
                          child: controller.isLoading.value
                              ? CircularProgressIndicator()
                              : Text('Entrar'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
