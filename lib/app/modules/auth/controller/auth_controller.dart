import 'package:get/get.dart';
import 'package:book_hive/app/modules/auth/model/auth_model.dart';
import 'package:book_hive/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<User> currentUser = Rxn<User>();
  
  // Store registered users in memory for demo purposes
  final Map<String, User> _registeredUsers = {
    demoEmail: User(
      id: 1,
      name: demoName,
      email: demoEmail,
      isAdmin: false,
      penaltyPoints: 0,
    ),
  };

  // Static user data for demo purposes
  static const String demoEmail = 'user@example.com';
  static const String demoPassword = 'password';
  static const String demoName = 'Demo User';

  void togglePasswordVisibility() => isPasswordVisible.toggle();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));
      
      // Check if user exists in registered users
      if (_registeredUsers.containsKey(email)) {
        final user = _registeredUsers[email]!;
        
        // In a real app, you would verify the password here
        // For demo, we'll accept any non-empty password
        if (password.isNotEmpty) {
          currentUser.value = user;
          
          // Navigate to books page
          Get.offAllNamed(Routes.books);
          return;
        }
      }
      
      // If we get here, login failed
      errorMessage.value = 'Invalid email or password';
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
  
  void logout() {
    currentUser.value = null;
    Get.offAllNamed(Routes.login);
  }
  
  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));
      
      // Check if email is already registered
      if (_registeredUsers.containsKey(email)) {
        errorMessage.value = 'Email is already registered';
        return;
      }
      
      // Create new user
      final newUser = User(
        id: _registeredUsers.length + 1, // Simple ID generation for demo
        name: name,
        email: email,
        isAdmin: false,
        penaltyPoints: 0,
      );
      
      // Add to registered users
      _registeredUsers[email] = newUser;
      
      // Log the user in
      currentUser.value = newUser;
      Get.offAllNamed(Routes.books);
      
    } catch (e) {
      errorMessage.value = 'An error occurred during registration. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}