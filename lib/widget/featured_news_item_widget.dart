import 'package:flutter/material.dart';
import 'package:forestvpn_test/consts/colors.dart';
import 'package:forestvpn_test/consts/styles.dart';

class FeaturedNewsItemWidget extends StatelessWidget {
  const FeaturedNewsItemWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: MainColors.kBlackColor.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 14,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Text(
            title,
            style: MainStyles.kWhiteColor2W400(28.0),
          ),
        ),
      ),
    );
  }
}
