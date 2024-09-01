class PastOrders {
  final String image, title, subTitle;
  final String? date, status;

  PastOrders({
    required this.image,
    required this.title,
    required this.subTitle,
    this.date = '',
    this.status = '',
  });
}
