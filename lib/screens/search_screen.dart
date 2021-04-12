import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../models/breaking_news_model.dart';
import '../repositories/search_repository.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/custom_text.dart';
import 'search_results.dart';

class SearchScreen extends StatefulWidget {
  final model;

  const SearchScreen({Key key, this.model}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchNewsRepository repo = SearchNewsRepository();
  bool _loading = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _loading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.menu,
                  size: 28,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomText(
                  text: 'Discover',
                  weight: FontWeight.bold,
                  size: 28.0,
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: 'News from all over the world',
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    // leading: Icon(
                    //   Icons.search,
                    //   color: Colors.grey,
                    // ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) async {
                        setState(() {
                          _loading = true;
                        });
                        controller.clear();
                        List<NewsArticlesModel> searchedNewsArticles =
                            await repo.searchNews(value);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchResults(
                                searchResults: searchedNewsArticles,
                              );
                            },
                          ),
                        );
                        setState(() {
                          _loading = false;
                        });
                      },
                    ),
                    trailing: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        model: widget.model,
        isHome: false,
        isSearch: true,
      ),
    );
  }
}
