import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/random_quote/presentation/cubit/quote_cubit.dart';
import '../../../../core/utils/constants.dart';
import 'package:quotes/injection_container.dart' as di;

import '../../../splash/presentation/cubit/locale_cubit.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    Constants.screenWidth = width;

    return BlocProvider(
      create: (context) => di.sl<QuoteCubit>()..getRandomQuote(),
      child: BlocConsumer<QuoteCubit, QuoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          LocaleCubit cubit = LocaleCubit.get(context);

          return Scaffold(
            appBar: (state is! QuoteFailureState)
                ? AppBar(
                    // shape: ,
                    leading: Padding(
                      padding: EdgeInsetsDirectional.only(start: width / 15),
                      child: InkWell(
                        onTap: () {
                          cubit.changeLanguage();
                        },
                        child: Icon(
                          Icons.translate_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    title: Column(
                      children: [
                        // SizedBox(
                        //   height: width / 20,
                        // ),
                        Text(AppLocalizations.of(context)!
                            .translate('app_name')!),
                        // Text(AppStrings.appName),
                      ],
                    ),
                  )
                : null,
            body: ConditionalBuilder(
              condition: state is! QuoteLoadingState,
              builder: (context) => context.watch<QuoteCubit>().body,
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
