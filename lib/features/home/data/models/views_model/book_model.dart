class BookModel {
  final String id;
  final String title;
  final String author;
  final String categories;
  final dynamic averageRating;
  final dynamic ratingCount;
  final String thumbnail;
  final String previewLink;
  final String amount;
  final String currencyCode;

  BookModel(
      {required this.id,
      required this.title,
      required this.author,
      required this.categories,
      required this.averageRating,
      required this.ratingCount,
      required this.thumbnail,
      required this.previewLink,
      required this.amount,
      required this.currencyCode});
  factory BookModel.jsonData(Map<String, dynamic> data) {
    var isForSale = forSale(data);
    return BookModel(
        id: data["id"],
        title: data["volumeInfo"]["title"],
        author: data["volumeInfo"]["authors"][0] ?? "",
        categories: data["volumeInfo"]?["categories"][0] ?? "",
        averageRating: data["volumeInfo"]["averageRating"] ?? '0.0',
        ratingCount: data["volumeInfo"]["ratingsCount"] ?? '0',
        thumbnail: data["volumeInfo"]["imageLinks"]["thumbnail"],
        previewLink: data["volumeInfo"]["previewLink"] ?? "",
        amount: isForSale? '${data["saleInfo"]["listPrice"]["amount"].toString()} €' : ' €',
        currencyCode: isForSale? data["saleInfo"]["listPrice"]["currencyCode"].toString() : ''
    );
  }
}
bool forSale(Map<String, dynamic> data){
  if (data["saleInfo"]["saleability"] == 'FOR_SALE'){
    return true;
  }
  else {
    return false;
  }
}
