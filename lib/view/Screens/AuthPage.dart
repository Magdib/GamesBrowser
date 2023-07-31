import 'package:flutter/material.dart';
import 'package:gamesbrowser/controller/AuthController.dart';
import 'package:gamesbrowser/core/constant/Colors.dart';
import 'package:gamesbrowser/view/Widgets/shared/CustomButton.dart';
import 'package:get/get.dart';

import '../Widgets/AuthPage/TitledTextField.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepgreen,
        elevation: 0,
        title: Text(
          "التحقق من المستخدم",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitledTextField(
                      label: "اسم المستخدم",
                      hint: "أكتب اسم المستخدم هنا...",
                      textEditingController: controller.userName),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<AuthController>(
                      builder: (controller) => TitledTextField(
                            label: "الرمز السري",
                            hint: "أكتب الرمز الخاص بك هنا...",
                            textEditingController: controller.code,
                            obscure: controller.obscureCode,
                          )),
                ],
              ),
            ),
            GetBuilder<AuthController>(
                builder: (controller) => CustomButton(
                    text: "تحقق",
                    onPressed: controller.canCheckUser
                        ? () => controller.checkUser()
                        : null))
          ],
        ),
      ),
    );
  }
}
