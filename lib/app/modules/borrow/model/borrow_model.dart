class BorrowRecord {
  final int id;
  final int bookId;
  final String bookTitle;
  final DateTime borrowDate;
  final DateTime dueDate;
  final DateTime? returnDate;
  final bool isLate;

  BorrowRecord({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.borrowDate,
    required this.dueDate,
    this.returnDate,
    required this.isLate,
  });

  factory BorrowRecord.fromJson(Map<String, dynamic> json) {
    return BorrowRecord(
      id: json['id'],
      bookId: json['book']['id'],
      bookTitle: json['book']['title'],
      borrowDate: DateTime.parse(json['borrow_date']),
      dueDate: DateTime.parse(json['due_date']),
      returnDate: json['return_date'] != null ? DateTime.parse(json['return_date']) : null,
      isLate: json['is_late'],
    );
  }
}