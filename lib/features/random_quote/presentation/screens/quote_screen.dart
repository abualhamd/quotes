import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/assets_manager.dart';
import 'package:quotes/core/utils/media_query_values.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';

class Quotes extends StatelessWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Constants.showToast(msg: 'hello there');
            },
            child: Text(
              'بسم الله',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: AppColors.random, fontFamily: AppStrings.fontFamily, fontSize: context.width/10),
            ),
          ),
          Image.asset(ImgManager.randImg),
        ],
      ),
    );
  }
}
