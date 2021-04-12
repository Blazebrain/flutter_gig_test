import 'package:flutter/material.dart';

import '../models/breaking_news_model.dart';
import '../widgets/screen_results_widgets.dart';

class SearchResults extends StatefulWidget {
  final List<NewsArticlesModel> searchResults;
  SearchResults({
    Key key,
    this.searchResults,
  }) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  _SearchResultsState();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.searchResults.clear();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              widget.searchResults.clear();
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff45376A),
          // Color(0xff2556D9),
          title: new Text(
            // movieData['expression'],
            'Search Results',
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
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) => SearchResultsWidget(
                breakingNewsModel: widget.searchResults[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
