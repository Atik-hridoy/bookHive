class Book {
  final int id;
  final String title;
  final String description;
  final String author;
  final String category;
  final int totalCopies;
  final int availableCopies;
  final String? coverUrl;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.category,
    required this.totalCopies,
    required this.availableCopies,
    this.coverUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      author: json['author']['name'],
      category: json['category']['name'],
      totalCopies: json['total_copies'],
      availableCopies: json['available_copies'],
      coverUrl: json['cover_url'],
    );
  }
}