import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_password_controller.dart';
import 'components/body_view.dart';

class EditPasswordView extends GetView<EditPasswordController> {
  const EditPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password', style: TextStyle(color: Colors.black, fontFamily: 'Nunito-Bold')),
        centerTitle: true,
      ),
      body: BodyView(),
    );
  }
}
