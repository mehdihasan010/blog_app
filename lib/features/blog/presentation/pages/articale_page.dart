import 'package:blog_app/core/constants/app_assets.dart';
import 'package:blog_app/features/blog/presentation/widgets/article_card.dart';
import 'package:flutter/material.dart';

final List<List<Widget>> pages = [
  // Latest Section
  [
    const ArticleCard(
      imageUrl: AppAssets.imagesProductivity,
      date: '3 Feb 2024',
      readTime: '05 Mins Read',
      title: 'Make design systems people want to use.',
      likes: '22.8k',
      comments: '8k',
    ),
    const ArticleCard(
      imageUrl: AppAssets.imagesProductivity,
      date: '3 Feb 2024',
      readTime: '10 Mins Read',
      title: 'Become master in color palette.',
      likes: '32.2k',
      comments: '10k',
    ),
  ],
  // Featured Section
  [
    const ArticleCard(
      imageUrl: AppAssets.imagesProductivity,
      date: '3 Feb 2024',
      readTime: '08 Mins Read',
      title: 'Ux Design Industry 2021 Growth.',
      likes: '80.3k',
      comments: '9k',
    ),
  ],
  // Premium Section
  [
    const ArticleCard(
      imageUrl: AppAssets.imagesProductivity,
      date: '3 Feb 2024',
      readTime: '20 Mins Read',
      title: 'Using motion design 2 animate graphics.',
      likes: '50.1k',
      comments: '6k',
    ),
  ],
];
