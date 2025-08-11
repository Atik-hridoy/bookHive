import 'package:get/get.dart';
import 'package:book_hive/app/modules/books/controller/book_controller.dart';
import 'package:book_hive/app/modules/borrow/controller/borrow_controller.dart';
import 'package:book_hive/app/modules/auth/controller/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() { 
    // Controllers
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => BookController());
    Get.lazyPut(() => BorrowController());
  }
}