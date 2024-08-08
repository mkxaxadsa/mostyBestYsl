// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:football_app/core/constants/app_icons.dart';
import 'package:football_app/core/extensions/align_ext_on_widget.dart';
import 'package:football_app/core/extensions/expanded_ext_on_widget.dart';
import 'package:football_app/core/extensions/mediaquery_ext_on_context.dart';
import 'package:football_app/core/extensions/padding_extension_on_widget.dart';
import 'package:football_app/core/models/news_item_model.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen({
    super.key,
    required this.item,
  });
  final NewsItemModel item;
  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff003266),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 372,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: widget.item.imageUrl,
                    cacheKey: widget.item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0x00111111), Color(0xFF003266)],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Text(
                    widget.item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingAll(16).align(Alignment.bottomLeft),
                ),
                Positioned(
                  left: 16,
                  top: 16 + context.padding.top,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppIcons.arrowLeft,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.item.text,
            style: const TextStyle(
              color: Color(0x66FAFAFA),
              fontSize: 16,
              fontFamily: 'Inter',
            ),
          ).paddingAll(16),
        ],
      ),
    );
  }
}
