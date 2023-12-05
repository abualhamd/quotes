import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/features/random_quote/data/models/quote_model.dart';
import '../../../../core/api/end_points.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;

  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final List<dynamic> quotes = await apiConsumer.get(
        path: EndPoints.ninjasAPI,
        headers: {'X-Api-Key': dotenv.env['API_KEY']});
    return QuoteModel.fromJson(quotes[0]);
  }
}
