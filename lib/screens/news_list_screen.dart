import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/blocs/all_news_bloc/all_news_bloc.dart';
import 'package:forestvpn_test/consts/colors.dart';
import 'package:forestvpn_test/consts/strings.dart';
import 'package:forestvpn_test/consts/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/screens/one_new_screen.dart';
import 'package:forestvpn_test/widget/custom_app_bar_widget.dart';
import 'package:forestvpn_test/widget/featured_news_item_widget.dart';
import 'package:forestvpn_test/widget/latest_news_item_widget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    BlocProvider.of<AllNewsBloc>(context).add(GettingAllArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsBloc, AllNewsState>(
      builder: (context, state) {
        return getNewsListScreenWidget(state);
      },
    );
  }

  Widget getNewsListScreenWidget(AllNewsState state) {
    Widget newsListScreenWidget = const SizedBox();

    if (state is AllNewsLoading) {
      newsListScreenWidget = const Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        body: Center(
          child: SizedBox(
            height: 60.0,
            width: 60.0,
            child: CircularProgressIndicator(
              color: MainColors.kBlackColor,
              backgroundColor: Colors.transparent,
              strokeWidth: 5.0,
            ),
          ),
        ),
      );
    } else if (state is AllNewsError) {
      newsListScreenWidget = Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        body: Center(
          child: Text(
            Strings.checkYourNetworkConnection,
            style: MainStyles.kGreyColorW400(30.0),
          ),
        ),
      );
    } else if (state is AllNewsSuccess) {
      List<Article> latestArticles = BlocProvider.of<AllNewsBloc>(context).latestArticles;
      List<Article> featuredArticles = BlocProvider.of<AllNewsBloc>(context).featuredArticles;

      newsListScreenWidget = Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        appBar: AppBar(
          toolbarHeight: 68,
          elevation: 0,
          backgroundColor: MainColors.kWhiteColor,
          flexibleSpace: CustomAppBarWidget(
            onTapReaded: () {
              BlocProvider.of<AllNewsBloc>(context).add(ReadAllArticlesEvent());
            },
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          Strings.featured,
                          style: MainStyles.kBlackColorW400(18.0),
                        ),
                      ),
                      SizedBox(
                        height: 340.0,
                        child: PageView.builder(
                          itemCount: featuredArticles.length,
                          itemBuilder: (context, index) {
                            return FeaturedNewsItemWidget(
                              title: featuredArticles[index].title,
                              image: featuredArticles[index].imageUrl,
                              readed: featuredArticles[index].readed,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          Strings.latestNews,
                          style: MainStyles.kBlackColorW400(18.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        shrinkWrap: true,
                        itemCount: latestArticles.length,
                        itemBuilder: (context, index) {
                          var differenceTime = DateTime.now().difference(latestArticles[index].publicationDate).inDays;
                          return LatestNewsItemWidget(
                            image: latestArticles[index].imageUrl,
                            title: latestArticles[index].title,
                            publicationDate: differenceTime,
                            readed: latestArticles[index].readed,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OneNewScreen(
                                    article: latestArticles[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocProvider.of<AllNewsBloc>(context).loading
                ? Container(
                    color: MainColors.kWhiteColor.withOpacity(0.2),
                    child: const Center(
                      child: SizedBox(
                        height: 60.0,
                        width: 60.0,
                        child: CircularProgressIndicator(
                          color: MainColors.kBlackColor,
                          backgroundColor: Colors.transparent,
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    return newsListScreenWidget;
  }
}
