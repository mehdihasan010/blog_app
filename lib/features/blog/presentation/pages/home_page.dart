import 'package:blog_app/core/constants/app_assets.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/article_provider.dart';
import '../../domain/entities/blog_entity.dart';
import '../widgets/article_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static String name = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsyncValue = ref.watch(articlesProvider);
    final categoriesValue = ref.watch(categoriesProvider);
    final blogStream = ref.watch(blogStreamProvider);

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _buildLogo(),
              const SizedBox(height: 10),
              _buildSearchField(),
              const SizedBox(height: 20),
              _buildCategoriesTabBar(categoriesValue),
              const SizedBox(height: 10),
              Expanded(child: _buildArticlesTabView(blogStream)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPallete.gradient1,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  /// Builds the app bar
  AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Image.asset(
              AppAssets.iconsMenu,
              width: 32,
              height: 32,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Image(
              image: AssetImage(AppAssets.imagesProfile),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the drawer
  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppPallete.gradient1,
            ),
            child: Column(
              children: [
                const Text(
                  'Mehdi Hassan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.premium,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Premium User .Lv 3',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Supporters 24.7K',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.lightBlue),
            title: const Text('Homepage'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.pinkAccent),
            title: const Text('Notifications'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.purpleAccent),
            title: const Text('History'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.teal),
            title: const Text('Help & Support'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }

  /// Builds the logo widget
  Widget _buildLogo() {
    return Image.asset(
      AppAssets.imagesLogo,
      width: 250,
    );
  }

  /// Builds the search field with consistent theming
  Widget _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Iconsax.search_normal_1),
        hintText: 'Search Blogs',
        hintStyle: const TextStyle(color: AppPallete.borderColor),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppPallete.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: AppPallete.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: AppPallete.gradient1),
        ),
      ),
    );
  }

  /// Builds the categories TabBar
  Widget _buildCategoriesTabBar(AsyncValue<List<String>> categoriesValue) {
    return categoriesValue.when(
      data: (categories) {
        return SizedBox(
          height: 40,
          child: Builder(builder: (context) {
            final tabController = DefaultTabController.of(context);

            // Attach a listener to update UI on tab changes
            tabController?.addListener(() {
              (context as Element).markNeedsBuild();
            });
            return TabBar(
              controller: tabController,
              tabs: List.generate(categories.length, (index) {
                final isSelected = tabController?.index == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              }),
            );
          }),
        );
      },
      error: (error, _) => Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  /// Builds the articles TabBarView
  Widget _buildArticlesTabView(
      AsyncValue<List<BlogEntity>> articlesAsyncValue) {
    return articlesAsyncValue.when(
      data: (articles) {
        return TabBarView(
          children: [
            _buildArticleList(articles),
            _buildArticleList(articles),
            _buildArticleList(articles),
          ],
        );
      },
      error: (error, _) => Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  /// Builds a list of articles
  Widget _buildArticleList(List<BlogEntity> articles) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleCard(blog: article);
      },
    );
  }
}
