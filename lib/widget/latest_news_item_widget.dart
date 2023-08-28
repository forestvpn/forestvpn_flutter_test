import 'package:flutter/material.dart';
import 'package:forestvpn_test/consts/colors.dart';
import 'package:forestvpn_test/consts/styles.dart';

class LatestNewsItemWidget extends StatelessWidget {
  const LatestNewsItemWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor2,
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: [
          BoxShadow(
            color: MainColors.kBlackColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: MainColors.kWhiteColor2,
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(9.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 23.0, left: 20.0, right: 20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    image,
                    height: 60.0,
                    width: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 23.0),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: MainStyles.kBlackColorW400(16.0),
                        ),
                        Text(
                          title,
                          style: MainStyles.kGreyColorW400(12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
