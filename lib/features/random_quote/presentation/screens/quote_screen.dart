import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import '../../../../core/utils/app_colors.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    TextStyle quoteTextStyle = TextStyle(
        color: Colors.white,
        fontSize: width / 20,
        fontWeight: FontWeight.bold,
        height: width / 300);

    Widget body = Column(
      children: [
        SizedBox(
          height: width / 15,
        ),
        Padding(
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
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                    style: quoteTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Bill Gates',
                  style: quoteTextStyle,
                ),
                SizedBox(
                  height: width / 18,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: width / 10,
        ),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.refresh_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
    //Container(
    //             decoration: BoxDecoration(
    //               color: AppColors.primary,
    //               borderRadius: BorderRadius.circular(width / 10),
    //             ),
    //             padding: const EdgeInsets.all(10.0),
    //             child: Text(
    //               "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: width / 20,
    //                   height: width / 250),
    //               textAlign: TextAlign.center,
    //             ),
    //           )

    // Constants.screenWidth = context.width;

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
  }
}
