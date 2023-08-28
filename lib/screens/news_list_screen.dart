import 'package:flutter/material.dart';
import 'package:forestvpn_test/consts/colors.dart';
import 'package:forestvpn_test/consts/strings.dart';
import 'package:forestvpn_test/consts/styles.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/widget/custom_app_bar_widget.dart';
import 'package:forestvpn_test/widget/featured_news_item_widget.dart';
import 'package:forestvpn_test/widget/latest_news_item_widget.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      appBar: AppBar(
        toolbarHeight: 68,
        elevation: 0,
        backgroundColor: MainColors.kWhiteColor,
        flexibleSpace: const CustomAppBarWidget(),
      ),
      body: SafeArea(
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
                    itemCount: _mockArticles.length,
                    itemBuilder: (context, index) {
                      return FeaturedNewsItemWidget(
                        title: _mockArticles[index].title,
                        image: _mockArticles[index].imageUrl,
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
                  itemCount: _mockArticles.length,
                  itemBuilder: (context, index) {
                    var differenceTime = DateTime.now().difference(_mockArticles[index].publicationDate).inDays;
                    return LatestNewsItemWidget(
                      image: _mockArticles[index].imageUrl,
                      title: _mockArticles[index].title,
                      publicationDate: differenceTime,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final _mockArticles = [
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    title: 'We are processing your request...',
    publicationDate: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl: 'assets/images/image_1.jpg',
    description: '''Please excuse the interruption.  
Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
Regrettably, this is beyond our control.  
To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
  ),
  Article(
    id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
    title: 'What is Lorem Ipsum...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2)),
    imageUrl: 'assets/images/image_2.jpg',
    description:
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
  ),
  Article(
    id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
    title: 'Why do we use it...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    imageUrl: 'assets/images/image_3.jpg',
    description:
        '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    title: 'Where does it come from...',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    imageUrl: 'assets/images/image_4.jpg',
    description:
        '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
  ),
];
