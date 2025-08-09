import 'package:book_hive/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/modules/books/model/book_model.dart';
import 'package:book_hive/app/modules/borrow/controller/borrow_controller.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final BorrowController borrowController;

  const BookCard({required this.book, required this.borrowController});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Get.toNamed(Routes.borrow, arguments: book.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: book.coverUrl != null
                    ? Image.network(
                        book.coverUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Container(
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: Icon(Icons.book, size: 48, color: Colors.grey),
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Get.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    book.author,
                    style: Get.textTheme.bodySmall,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.library_books, size: 16),
                      SizedBox(width: 4),
                      Text('\${book.availableCopies}/\${book.totalCopies} available'),
                      Spacer(),
                      if (book.availableCopies > 0)
                        ElevatedButton(
                          onPressed: () => borrowController.borrowBook(book.id),
                          child: Text('Borrow'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}