import 'package:book_hive/app/constants/api_routes.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/data/remote/api_service.dart';
import 'package:book_hive/app/modules/borrow/model/borrow_model.dart';

class BorrowController extends GetxController {
  final ApiService api = Get.find();
  
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
      final response = await api.get(ApiRoutes.userBorrows);
      final List<BorrowRecord> fetchedBorrows = (response.data as List)
          .map((borrowJson) => BorrowRecord.fromJson(borrowJson))
          .toList();
          
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
      await api.post(ApiRoutes.borrow, {'book_id': bookId});
      await fetchUserBorrows();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to borrow book');
      return false;
    }
  }

  Future<bool> returnBook(int borrowId) async {
    try {
      await api.post(ApiRoutes.returnBook, {'borrow_id': borrowId});
      await fetchUserBorrows();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to return book');
      return false;
    }
  }
}