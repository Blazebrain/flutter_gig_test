import 'package:flutter/material.dart';
import '../models/breaking_news_model.dart';
import '../utilities/changescreen.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/breaking_news_widget.dart';
import '../widgets/custom_text.dart';
import 'more_breaking_news.dart';

class BreakingNewsScreen extends StatelessWidget {
  final List<NewsArticlesModel> model;

  const BreakingNewsScreen({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(model[0].urlToImage),
                        // image: NetworkImage(snapshot.data[0].urlToImage),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.3),
                          Colors.black.withOpacity(0.4),
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.menu,
                            size: 32,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.6),
                              // color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.all(8),
                            child: CustomText(
                              text: "#1 Breaking News",
                              color: Colors.white,
                              weight: FontWeight.w600,
                              size: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.transparent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.all(8),
                            child: CustomText(
                              text: model[0].title,
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 22.0,
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     changeScreen(
                          //         BreakingNewsDetailsScreen(
                          //           breakingNewsModel: model[0],
                          //         ),
                          //         context);
                          //   },
                          //   child: Padding(
                          //     padding: EdgeInsets.only(left: 8),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         CustomText(
                          //           text: 'See all below',
                          //           color: Colors.white,
                          //           weight: FontWeight.w500,
                          //           size: 18.0,
                          //         ),
                          //         Icon(
                          //           Icons.arrow_forward,
                          //           color: Colors.white,
                          //           size: 28,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Breaking News',
                    weight: FontWeight.bold,
                    size: 24.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      changeScreen(
                          MoreBreakingNews(
                            moreBreakingNews: model,
                          ),
                          context);
                    },
                    child: CustomText(
                      text: 'More',
                      size: 16.0,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 300,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: BreakingNewsWidget(
                        breakingNewsModel: model[int],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        model: model,
        isHome: true,
        isSearch: false,
      ),
    );
  }
}
