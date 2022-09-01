import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/locale/app_localizations.dart';
import '../../features/random_quote/presentation/cubit/quote_cubit.dart';
import '../utils/constants.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;
  final double width = Constants.screenWidth!;
  MyErrorWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.warning_amber_rounded,
          size: width / 3,
        ),
        Text(
          AppLocalizations.of(context)!.translate("something_went_wrong")!,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width / 25),
          // Text(AppLocalizations.of(context)!
          //               .translate('app_name')!)
          child: Text(
            AppLocalizations.of(context)!
                .translate("check_your_internet_connection")!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.grey,
                  fontSize: width / 25,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<QuoteCubit>().getRandomQuote();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: width / 70, horizontal: width / 10),
            child: Text(
              AppLocalizations.of(context)!.translate("reload_screen")!,
              // 'Reload Screen',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
