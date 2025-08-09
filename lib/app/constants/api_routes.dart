class ApiRoutes {
  static const String baseUrl = 'https://api.library.example.com';
  
  // Auth
  static const String login = '/api/login/';
  static const String register = '/api/register/';
  
  // Books
  static const String books = '/api/books/';
  static const String bookDetail = '/api/books/{id}/';
  
  // Borrow
  static const String borrow = '/api/borrow/';
  static const String returnBook = '/api/return/';
  static const String userBorrows = '/api/borrow/';
}