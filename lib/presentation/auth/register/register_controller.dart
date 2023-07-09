import 'dart:async';

import 'package:edspert_flutter_final_project_elearning/data/model/user_registration_request.dart';
import 'package:edspert_flutter_final_project_elearning/domain/use_case/auth/register_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/service/firebase_auth_service.dart';

class RegisterController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final RegisterUserUseCase registerUserUseCase;

  RegisterController({required this.registerUserUseCase, required this.firebaseAuthService});

  late TextEditingController emailTextController;

  @override
  void onInit() {
    super.onInit();

    String email = firebaseAuthService.getCurrentSignedInUserEmail() ?? '';
    emailTextController =  TextEditingController(text: email);
  }

  Future<bool> registerUser({required UserRegistrationRequest userBody}) async {
    return await registerUserUseCase.call(userBody: userBody);
  }
}