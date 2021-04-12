import 'package:flutter/material.dart';

import '../models/breaking_news_model.dart';
import '../screens/breaking_news_details_screen.dart';
import '../utilities/changescreen.dart';
import 'custom_text.dart';

class BreakingNewsWidget extends StatelessWidget {
  final NewsArticlesModel breakingNewsModel;

  const BreakingNewsWidget({Key key, this.breakingNewsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen(
            BreakingNewsDetailsScreen(breakingNewsModel: breakingNewsModel),
            context);
      },
      child: Container(
        height: 225,
        width: 225,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: breakingNewsModel.urlToImage != null
                        ? NetworkImage(breakingNewsModel.urlToImage)
                        : AssetImage('images/no-image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              CustomText(
                text: breakingNewsModel.title,
                weight: FontWeight.bold,
                size: 16.0,
              ),
              SizedBox(height: 8),
              CustomText(
                text: breakingNewsModel.publishedAt,
                color: Colors.grey,
                weight: FontWeight.w700,
              ),
              SizedBox(height: 4),
              CustomText(
                text: 'By ' + breakingNewsModel.author.toString(),
                color: Colors.grey,
                weight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
