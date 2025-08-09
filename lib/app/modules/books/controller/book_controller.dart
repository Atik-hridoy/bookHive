import 'package:book_hive/app/constants/api_routes.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/data/remote/api_service.dart';
import 'package:book_hive/app/modules/books/model/book_model.dart';

class BookController extends GetxController {
  final ApiService api = Get.find();
  
  final RxList<Book> books = <Book>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    isLoading.value = true;
    try {
      final response = await api.get(ApiRoutes.books);
      final List<Book> fetchedBooks = (response.data as List)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList();
      books.assignAll(fetchedBooks);
    } finally {
      isLoading.value = false;
    }
  }

  List<Book> get filteredBooks {
    if (searchQuery.isEmpty) return books;
    return books.where((book) => 
      book.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
      book.author.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }
}