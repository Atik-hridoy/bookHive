// lib/app/modules/auth/view/login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/modules/auth/controller/auth_controller.dart';
import 'package:book_hive/app/widgets/loading_indicator.dart';
import 'package:book_hive/app/routes/app_pages.dart';
import 'package:book_hive/app/constants/app_constants.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                // Header
                Text(
                  'Welcome to BookHive',
                  style: Get.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Login to continue',
                  style: Get.textTheme.bodyLarge?.copyWith(
                    color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 40),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Password Field
                Obx(() => TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _authController.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () => _authController.togglePasswordVisibility(),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: !_authController.isPasswordVisible.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                )),
                SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to forgot password screen
                    },
                    child: Text('Forgot Password?'),
                  ),
                ),
                SizedBox(height: 24),

                // Login Button
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _authController.isLoading.value
                        ? null
                        : _handleLogin,
                    child: _authController.isLoading.value
                        ? LoadingIndicator()
                        : Text('Login'),
                  ),
                )),
                SizedBox(height: 16),

                // Error Message
                Obx(() => _authController.errorMessage.value.isNotEmpty
                    ? Text(
                        _authController.errorMessage.value,
                        style: Get.textTheme.bodyMedium?.copyWith(
                          color: Get.theme.colorScheme.error,
                        ),
                      )
                    : SizedBox.shrink()),
                SizedBox(height: 24),

                // Register Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => Get.offAndToNamed(Routes.register),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      
      await _authController.login(email, password);
    }
  }

}