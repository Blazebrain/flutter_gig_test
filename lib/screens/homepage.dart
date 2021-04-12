import 'package:flutter/material.dart';

import '../models/breaking_news_model.dart';
import '../repositories/breakingNews_repository.dart';
import '../utilities/changescreen.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import 'breaking_news_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BreakingNewsRepository repo = BreakingNewsRepository();
  List<NewsArticlesModel> breakingNews;
  initI() async {
    breakingNews = await repo.getBreakingNews();
    changeScreen(BreakingNewsScreen(model: breakingNews), context);
  }

  @override
  void initState() {
    initI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        model: breakingNews,
        isHome: true,
        isSearch: false,
      ),
    );
  }
}
