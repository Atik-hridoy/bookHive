import 'package:get/get.dart';
import 'package:book_hive/app/modules/auth/view/login_page.dart';
import 'package:book_hive/app/modules/books/view/books_page.dart';
import 'package:book_hive/app/modules/borrow/view/borrow_page.dart';
import 'package:book_hive/app/modules/auth/view/register_page.dart';

abstract class Routes {
  static const initial = '/login';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const books = '/books';
  static const borrow = '/borrow';
  static const profile = '/profile';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.books,
      page: () => BooksPage(),
    ),
    GetPage(
      name: Routes.borrow,
      page: () => BorrowPage(),
    ),
  ];

  static String get initial => Routes.login;
}