import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import 'package:quotes/features/splash/presentation/provider/locale_provider.dart';
import '../../../../core/utils/constants.dart';

import '../../../../core/widgets/error_widget.dart';
import '../provider/random_quote_provider.dart';
import '../widgets/quote_screen_body.dart';

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(randomQuoteProvider).mapOrNull(
      // data: data,
      // error: error,
      loading: (_) {
        if (kDebugMode) {
          print("is loading");
        }
      },
    );

    final double width = context.width;
    Constants.screenWidth = width;

    // LocaleCubit cubit = LocaleCubit.get(context);

    return Scaffold(
      appBar: ref.watch(randomQuoteProvider).maybeMap(
          error: (_) => const PreferredSize(
              preferredSize: Size.zero, child: SizedBox.shrink()),
          orElse: () {
            return AppBar(
              leading: Padding(
                padding: EdgeInsetsDirectional.only(start: width / 15),
                child: InkWell(
                  onTap: () async{
                    await ref.read(languageCodeProvider.notifier).changeLang();
                  },
                  child: Icon(
                    Icons.translate_outlined,
                    color: AppColors.primary,
                  ),
                ),
              ),
              title: Column(
                children: [
                  Text(AppLocalizations.of(context)!.translate('app_name')!),
                ],
              ),
            );
          }),
      body: ref.watch(randomQuoteProvider).map(
            data: (quote) {
              return QuoteScreenBody(
                quote: quote.value,
                onTap: () {
                  ref.invalidate(randomQuoteProvider);
                },
              );
            },
            error: (error) {
              return MyErrorWidget(msg: error.error.toString());
            },
            loading: (_) => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
