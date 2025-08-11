import 'package:book_hive/app/modules/books/model/book_model.dart';
import 'package:book_hive/app/modules/borrow/model/borrow_model.dart';

class StaticData {
  static final List<Book> books = [
    Book(
      id: 1,
      title: 'The Great Gatsby',
      description: 'A story of decadence, excess, and the American Dream.',
      author: 'F. Scott Fitzgerald',
      category: 'Classic',
      totalCopies: 5,
      availableCopies: 3,
      coverUrl: 'https://example.com/gatsby.jpg',
    ),
    Book(
      id: 2,
      title: 'To Kill a Mockingbird',
      description: 'A powerful story of racial injustice and moral growth.',
      author: 'Harper Lee',
      category: 'Fiction',
      totalCopies: 4,
      availableCopies: 2,
      coverUrl: 'https://example.com/mockingbird.jpg',
    ),
    Book(
      id: 3,
      title: '1984',
      description: 'A dystopian novel about totalitarianism and surveillance.',
      author: 'George Orwell',
      category: 'Science Fiction',
      totalCopies: 6,
      availableCopies: 4,
      coverUrl: 'https://example.com/1984.jpg',
    ),  
    Book(
      id: 4,
      title: 'Pride and Prejudice',
      description: 'A romantic novel of manners.',
      author: 'Jane Austen',
      category: 'Classic',
      totalCopies: 3,
      availableCopies: 1,
      coverUrl: 'https://example.com/pride.jpg',
    ),
    Book(
      id: 5,
      title: 'The Hobbit',
      description: 'A fantasy novel about the adventures of Bilbo Baggins.',
      author: 'J.R.R. Tolkien',
      category: 'Fantasy',
      totalCopies: 5,
      availableCopies: 5,
      coverUrl: 'https://example.com/hobbit.jpg',
    ),
  ];

  static List<BorrowRecord> get borrowRecords {
    final now = DateTime.now();
    
    return [
      BorrowRecord(
        id: 1,
        bookId: 1,
        bookTitle: 'The Great Gatsby',
        borrowDate: now.subtract(Duration(days: 5)),
        dueDate: now.add(Duration(days: 9)),
        returnDate: null,
        isLate: now.isAfter(now.add(Duration(days: 9))),
      ),
      BorrowRecord(
        id: 2,
        bookId: 3,
        bookTitle: '1984',
        borrowDate: now.subtract(Duration(days: 10)),
        dueDate: now.subtract(Duration(days: 2)),
        returnDate: now.subtract(Duration(days: 1)),
        isLate: now.subtract(Duration(days: 1)).isAfter(now.subtract(Duration(days: 2))),
      ),
      BorrowRecord(
        id: 3,
        bookId: 2,
        bookTitle: 'To Kill a Mockingbird',
        borrowDate: now.subtract(Duration(days: 2)),
        dueDate: now.add(Duration(days: 12)),
        returnDate: null,
        isLate: now.isAfter(now.add(Duration(days: 12))),
      ),
    ];
  }
}
