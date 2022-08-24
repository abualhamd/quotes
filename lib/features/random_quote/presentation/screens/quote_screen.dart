import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/quote_content.dart';
import 'package:quotes/injection_container.dart' as di;

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    Widget body;

    return BlocProvider(
      create: (context) => di.sl<QuoteCubit>()..getRandomQuote(),
      child: BlocConsumer<QuoteCubit, QuoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is QuoteSuccessState) {
            body = Column(
              children: [
                SizedBox(
                  height: width / 15,
                ),
                QuoteContent(
                  width: width,
                  quote: state.quote,
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
          } else {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  SizedBox(
                    height: width / 20,
                  ),
                  Text(AppStrings.appName),
                ],
              ),
            ),
            body: body,
          );
        },
      ),
    );
  }
}
