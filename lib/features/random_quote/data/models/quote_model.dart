import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required permalink, required author, required content, required id})
      : super(id: id, content: content, author: author, permalink: permalink);

  QuoteModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'].toString(),
          content: json['quote'],
          author: json['author'],
          permalink: json['permalink'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quote': content,
        'author': author,
        'permalink': permalink,
      };
}
