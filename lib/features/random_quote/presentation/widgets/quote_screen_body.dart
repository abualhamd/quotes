import 'package:flutter/material.dart';

import 'package:quotes/features/random_quote/presentation/widgets/quote_content.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/quote.dart';

class QuoteScreenBody extends StatelessWidget {
  final Quote quote;
  final VoidCallback onTap;
  const QuoteScreenBody({super.key, required this.quote, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = Constants.screenWidth!;

    return Column(
      children: [
        SizedBox(
          height: width / 15,
        ),
        QuoteContent(
          width: width,
          quote: quote,
        ),
        SizedBox(
          height: width / 10,
        ),
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            child: const Icon(
              Icons.refresh_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
