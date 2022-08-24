import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  final double width;
  final TextStyle quoteTextStyle;
  QuoteContent({Key? key, required this.width, required this.quote})
      : quoteTextStyle = TextStyle(
            color: Colors.white,
            fontSize: width / 20,
            fontWeight: FontWeight.bold,
            height: width / 300),
        super(key: key); //super(key: key)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width / 20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: AppColors.primary,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width / 20),
              child: Text(
                quote.content,
                style: quoteTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              quote.author,
              style: quoteTextStyle,
            ),
            SizedBox(
              height: width / 18,
            )
          ],
        ),
      ),
    );
  }
}
