import 'package:book_hive/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_hive/app/modules/books/controller/book_controller.dart';
import 'package:book_hive/app/widgets/book_card.dart';
import 'package:book_hive/app/widgets/loading_indicator.dart';

class BooksPage extends StatelessWidget {
  final BookController controller = Get.find();

  BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: BookSearchDelegate(),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: LoadingIndicator());
        }
        
        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,  
          ),
          itemCount: controller.filteredBooks.length,
          itemBuilder: (context, index) {
            final book = controller.filteredBooks[index];
            return BookCard(book: book, borrowController: Get.find());
          },
        );
      }),
    );
  }
}

class BookSearchDelegate extends SearchDelegate {
  final BookController controller = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    controller.searchQuery.value = query;
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    controller.searchQuery.value = query;
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return Obx(() => ListView.builder(
      itemCount: controller.filteredBooks.length,
      itemBuilder: (context, index) {
        final book = controller.filteredBooks[index];
        return ListTile(
          title: Text(book.title),
          subtitle: Text(book.author),
          onTap: () {
            close(context, null);
           // Get.toNamed(Routes.BOOK_DETAIL, arguments: book.id);
          },
        );
      },
    ));
  }
}