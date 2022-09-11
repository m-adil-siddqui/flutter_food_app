import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import './components/body_view.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SIGN IN", 
        style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)
        )
      ),
      body: BodyView(),
    );
  }
}
