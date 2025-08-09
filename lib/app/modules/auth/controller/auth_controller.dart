import 'dart:convert';
import 'dart:core';

import 'package:book_hive/app/constants/api_routes.dart';
import 'package:book_hive/app/constants/storage_keys.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/data/local/local_storage_service.dart';
import 'package:book_hive/app/data/remote/api_service.dart';
import 'package:book_hive/app/modules/auth/model/auth_model.dart';
import 'package:book_hive/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final ApiService _apiService = Get.find();
  final LocalStorageService _storage = Get.find();
  
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<User> currentUser = Rxn<User>();

  void togglePasswordVisibility() => isPasswordVisible.toggle();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final response = await _apiService.post(ApiRoutes.login, {
        'email': email,
        'password': password,
      });
      
      await _storage.writeSecure(StorageKeys.authToken, response.data['token']);
      final user = User.fromJson(response.data['user']);
      await _storage.writePref(StorageKeys.userData, jsonEncode(user.toJson()));
      
      currentUser.value = user;
      Get.offAllNamed(Routes.home);
    } catch (e) {
      errorMessage.value = e.toString().replaceAll('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }
}