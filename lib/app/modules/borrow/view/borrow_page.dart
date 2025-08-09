import 'package:book_hive/app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/modules/borrow/controller/borrow_controller.dart';
import 'package:intl/intl.dart';

class BorrowPage extends StatelessWidget {
  final BorrowController controller = Get.find();
  final DateFormat dateFormat = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Borrowings'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: LoadingIndicator());
          }
          
          return TabBarView(
            children: [
              _buildActiveBorrows(),
              _buildBorrowHistory(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildActiveBorrows() {
    return ListView.builder(
      itemCount: controller.activeBorrows.length,
      itemBuilder: (context, index) {
        final borrow = controller.activeBorrows[index];
        return Card(
          child: ListTile(
            title: Text(borrow.bookTitle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Borrowed: \${dateFormat.format(borrow.borrowDate)}'),
                Text('Due: \${dateFormat.format(borrow.dueDate)}'),
                if (borrow.isLate)
                  Text(
                    'Late!',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () => controller.returnBook(borrow.id),
              child: Text('Return'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBorrowHistory() {
    return ListView.builder(
      itemCount: controller.borrowHistory.length,
      itemBuilder: (context, index) {
        final borrow = controller.borrowHistory[index];
        return Card(
          child: ListTile(
            title: Text(borrow.bookTitle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Borrowed: \${dateFormat.format(borrow.borrowDate)}'),
                Text('Returned: \${dateFormat.format(borrow.returnDate!)}'),
                if (borrow.isLate)
                  Text(
                    'Was Late',
                    style: TextStyle(color: Colors.orange),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}