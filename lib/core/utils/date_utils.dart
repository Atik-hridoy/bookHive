class DateUtils {
  static String formatDate(DateTime date) {
    return '\${date.day}/\${date.month}/\${date.year}';
  }

  static int calculateDaysLate(DateTime dueDate, DateTime returnDate) {
    return returnDate.difference(dueDate).inDays;
  }
}