import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/app/global_navigator/global_navigator.dart';
import 'package:football_app/core/data/news_data.dart';
import 'package:football_app/core/extensions/mediaquery_ext_on_context.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/features/main/news/detail_news/detail_news_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 40 + context.padding.top, 16, 25),
      children: [
        const Text(
          'News',
          style: TextStyle(
            color: Color(0xFFFAFAFA),
            fontSize: 32,
            fontFamily: 'SF UI Display',
            fontWeight: FontWeight.w600,
          ),
        ).paddingOnly(bottom: 16),
        ...List.generate(
          news.length,
          (index) {
            final item = news[index];
            return GestureDetector(
              onTap: () {
                GlobalNavigator.push(context, page: DetailNewsScreen(item: item));
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        cacheKey: item.imageUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: 200,
                      ),
                    ).paddingOnly(bottom: 8),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Color(0x66FAFAFA),
                        fontFamily: 'SF UI Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Color(0xFFFAFAFA),
                        fontSize: 18,
                        fontFamily: 'SF UI Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 1,
                      color: const Color(0xff144273),
                    ).paddingSymetric(vertical: 16)
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
