// import 'package:book_hive/app/constants/api_routes.dart';
// import 'package:book_hive/app/data/remote/api_service.dart';

import 'package:get/get.dart';
import 'package:book_hive/app/modules/borrow/model/borrow_model.dart';
import 'package:book_hive/app/data/local/static_data.dart';

class BorrowController extends GetxController {
  final RxList<BorrowRecord> activeBorrows = <BorrowRecord>[].obs;
  final RxList<BorrowRecord> borrowHistory = <BorrowRecord>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchUserBorrows();
    super.onInit();
  }

  Future<void> fetchUserBorrows() async {
    isLoading.value = true;
    try {
      // Use static data instead of API call
      final List<BorrowRecord> fetchedBorrows = StaticData.borrowRecords;
      
      activeBorrows.assignAll(
        fetchedBorrows.where((b) => b.returnDate == null).toList()
      );
      borrowHistory.assignAll(
        fetchedBorrows.where((b) => b.returnDate != null).toList()
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> borrowBook(int bookId) async {
    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));
      
      // In a real app, this would be an API call
      // For now, we'll just refresh the data
      await fetchUserBorrows();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to borrow book');
      return false;
    }
  }

  Future<bool> returnBook(int borrowId) async {
    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));
      
      // In a real app, this would be an API call
      // For now, we'll just refresh the data
      await fetchUserBorrows();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to return book');
      return false;
    }
  }
}