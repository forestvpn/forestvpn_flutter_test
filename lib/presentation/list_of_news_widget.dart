import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

class ListOfNewsWidget extends StatefulWidget {
  const ListOfNewsWidget({super.key});

  @override
  State<ListOfNewsWidget> createState() => ListOfNewsWidgetState();
}

class ListOfNewsWidgetState extends State<ListOfNewsWidget> {
  void onNewTap(int index) {
    final id = mockArticles[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockArticles.length,
      itemExtent: 103,
      itemBuilder: (BuildContext context, int index) {
        final news = mockArticles[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Stack(
            children: [
              Container(
                //padding:
                //const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Image(
                      width: 90,
                      height: 60,
                      image: AssetImage(news.imageUrl),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.32,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            news.publicationDate.toString(),
                            maxLines: 2,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                              letterSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () => onNewTap(index),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
