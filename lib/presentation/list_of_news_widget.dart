import 'package:flutter/material.dart';

class ListOfNewsWidget extends StatefulWidget {
  const ListOfNewsWidget({super.key});

  @override
  State<ListOfNewsWidget> createState() => _ListOfNewsWidgetState();
}

class _ListOfNewsWidgetState extends State<ListOfNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 103,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Stack(
            children: [
              Container(
                //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage('images/1stimage.png'),
                    ),
                    SizedBox(
                      width: 23,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "We are processing your request...",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.32,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "1 day ago",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(9),
                  onTap: () {
                    // TODO: handle the press
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
