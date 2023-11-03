String publishedDateString(DateTime date) {
  final timeDifference = DateTime.now().difference(date);

  if (timeDifference < const Duration(hours: 1)) {
    final minutes = timeDifference.inMinutes;

    return '$minutes minute${minutes > 1 ? 's' : ''} ago';
  }

  if (timeDifference < const Duration(days: 1)) {
    final hours = timeDifference.inHours;

    return '$hours hour${hours > 1 ? 's' : ''} ago';
  }

  final days = timeDifference.inDays;
  return '$days day${days > 1 ? 's' : ''} ago';
}
