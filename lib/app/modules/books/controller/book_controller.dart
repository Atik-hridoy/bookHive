import 'package:get/get.dart';
import 'package:book_hive/app/data/local/static_data.dart';
import 'package:book_hive/app/modules/books/model/book_model.dart';

class BookController extends GetxController {
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
      // Use static data instead of API call
      books.assignAll(StaticData.books);
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