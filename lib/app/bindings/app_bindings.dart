import 'package:get/get.dart';
import 'package:book_hive/app/data/local/local_storage_service.dart';
import 'package:book_hive/app/data/remote/api_service.dart';
import 'package:book_hive/app/modules/auth/controller/auth_controller.dart';
import 'package:book_hive/app/modules/books/controller/book_controller.dart';
import 'package:book_hive/app/modules/borrow/controller/borrow_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() { 
    // Services
    Get.lazyPut(() => LocalStorageService());
    Get.lazyPut(() => ApiService());
    
    // Controllers
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => BookController());
    Get.lazyPut(() => BorrowController());
  }
}