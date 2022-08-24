import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/random_quote/presentation/widgets/quote_content.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/quote.dart';
import '../cubit/quote_cubit.dart';

class QuoteScreenBody extends StatelessWidget {
  final Quote quote;
  const QuoteScreenBody({super.key, required this.quote});

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
          onTap: () {
            context.read<QuoteCubit>().getRandomQuote();
          },
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
