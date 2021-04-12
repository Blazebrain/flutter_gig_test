import 'package:flutter/material.dart';

import '../models/breaking_news_model.dart';
import '../utilities/changescreen.dart';
import '../widgets/custom_text.dart';
import 'full_news_display_screen.dart';

class BreakingNewsDetailsScreen extends StatelessWidget {
  final NewsArticlesModel breakingNewsModel;

  const BreakingNewsDetailsScreen({Key key, this.breakingNewsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 2 * (MediaQuery.of(context).size.height / 3) - 50,
                    decoration: BoxDecoration(
                      // color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: breakingNewsModel.urlToImage != null
                            ? NetworkImage(breakingNewsModel.urlToImage)
                            : AssetImage('images/no-image.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 2 * (MediaQuery.of(context).size.height / 3) - 50,
                    decoration: BoxDecoration(
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
                            height: 10,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              // color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.all(8),
                            child: CustomText(
                              text: "News",
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
                              text: breakingNewsModel.title,
                              // text: snapshot.data[0].title,
                              weight: FontWeight.bold,
                              color: Colors.white,
                              size: 22.0,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2 * (MediaQuery.of(context).size.height / 3) - 100,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        height:
                            2 * (MediaQuery.of(context).size.height / 3) - 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(48),
                              topRight: Radius.circular(48)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        // height: 32,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomText(
                                              text: breakingNewsModel.author ??
                                                  "Anonymous",
                                              color: Colors.white,
                                              size: 14.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        // height: 32,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey[900],
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            CustomText(
                                              text: breakingNewsModel
                                                      .publishedAt ??
                                                  "",
                                              color: Colors.grey[900],
                                              size: 14.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              CustomText(
                                text: breakingNewsModel.description ??
                                    " No description given to this particular article yet",
                                size: 18.0,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(height: 24),
                              CustomText(
                                text: breakingNewsModel.content ??
                                    "No content available for this particular article yet, stay tuned.",
                                wordSpacing: 1.5,
                                size: 16.0,
                                color: Colors.black54,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'Continue reading... ',
                                      color: Colors.black),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        changeScreen(
                                            FullNewsDisplayScreen(
                                              newsUrl: breakingNewsModel.url,
                                            ),
                                            context);
                                      },
                                      child: CustomText(
                                        text: breakingNewsModel.url ?? "",
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
