import 'package:flutter/material.dart';

import '../models/breaking_news_model.dart';
import '../widgets/screen_results_widgets.dart';

class MoreBreakingNews extends StatefulWidget {
  final List<NewsArticlesModel> moreBreakingNews;
  MoreBreakingNews({
    Key key,
    this.moreBreakingNews,
  }) : super(key: key);

  @override
  _MoreBreakingNewsState createState() => _MoreBreakingNewsState();
}

class _MoreBreakingNewsState extends State<MoreBreakingNews> {
  _MoreBreakingNewsState();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.moreBreakingNews.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              widget.moreBreakingNews.clear();
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff45376A),
          // Color(0xff2556D9),
          title: new Text(
            // movieData['expression'],
            'More Breaking News',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Divider(),
              ),
              itemCount: widget.moreBreakingNews.length,
              itemBuilder: (context, index) => SearchResultsWidget(
                breakingNewsModel: widget.moreBreakingNews[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
