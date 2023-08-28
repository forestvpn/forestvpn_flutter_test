import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forestvpn_test/consts/colors.dart';
import 'package:forestvpn_test/consts/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class OneNewScreen extends StatelessWidget {
  const OneNewScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 485.0,
            collapsedHeight: 200.0,
            elevation: 0,
            backgroundColor: MainColors.kWhiteColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: MainColors.kBlackColor.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(article.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 40.0),
                      child: Text(
                        article.title,
                        style: MainStyles.kWhiteColor2W400(28.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/left_arrow.svg',
                    color: MainColors.kWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
              child: Column(
                children: [
                  // const SizedBox(height: 20.0),
                  Text(
                    article.description ?? '',
                    style: MainStyles.kBlackColorW400(16.0),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(article.imageUrl, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // Text(
                  //   article.description ?? '',
                  //   style: MainStyles.kBlackColorW400(16.0),
                  // ),
                  // const SizedBox(height: 20.0),
                  // Text(
                  //   article.description ?? '',
                  //   style: MainStyles.kBlackColorW400(16.0),
                  // ),
                  // const SizedBox(height: 20.0),
                  // Text(
                  //   article.description ?? '',
                  //   style: MainStyles.kBlackColorW400(16.0),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
